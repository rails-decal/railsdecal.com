# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  provider               :string(255)
#  uid                    :string(255)
#  name                   :string(255)
#  nickname               :string(255)
#  image_url              :string(255)
#  bio                    :text
#  blog                   :string(255)
#  location               :string(255)
#  enabled                :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  include StandingEnum

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :omniauthable, omniauth_providers: [:github]

  validates :email, case_sensitive: false,
                    allow_blank: true, if: :email_changed?
  validates_format_of :email, with: Devise.email_regexp,
                      allow_blank: true, if: :email_changed?
  validates_uniqueness_of :nickname

  has_many :roles
  has_many :student_applications

  has_many :check_ins
  has_many :check_in_codes, through: :check_ins

  extend FriendlyId
  friendly_id :nickname, use: :finders

  after_create :make_default_role

  scope :all_enabled, -> { where(enabled: true) }

  def first_name
    if name.nil? || name == nickname
      ''
    else
      name.split(' ').first
    end
  end

  def last_name
    if name.nil? || name == nickname
      ''
    else
      name.split(' ').last
    end
  end

  def make_default_role
    add_role_for_current_semester(Role::OBSERVER)
  end

  def current_role
    role_for_semester Semester.current
  end

  def role_for_semester(semester)
    self.roles.find_by(semester: semester)
  end

  def add_role_for_semester(role_name, semester)
    if role_name != Role::OBSERVER
      self.enabled = true
      self.save!
    end
    current_role = self.roles.find_by(semester: Semester.current)
    position = Position.find_by(name: role_name)
    unless current_role.nil?
      current_role.update_position(position)
    else
      self.roles.create(semester: Semester.current, position: position)
    end
  end

  def add_role_for_current_semester(role_name)
    add_role_for_semester(role_name, Semester.current)
  end

  def is_current_staff?
    is_staff_for_semester? Semester.current
  end

  def is_current_student?
    is_student_for_semester? Semester.current
  end


  def is_staff_for_semester?(semester)
    return false if role_for_semester(semester).nil?
    role_for_semester(semester).name == Role::INSTRUCTOR ||
    role_for_semester(semester).name == Role::TA
  end

  def is_student_for_semester?(semester)
    return false if role_for_semester(semester).nil?
    role_for_semester(semester).name == Role::STUDENT
  end

  def submitted_current_semester_application?
    !student_applications.find_by(semester: Semester.current).nil?
  end

  def self.find_for_github_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email || ""
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.nickname = auth.info.nickname
      user.bio = auth.extra.raw_info.bio
      user.blog = auth.extra.raw_info.blog
      user.location = auth.extra.raw_info.location
      user.image_url = auth.info.image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.github_data"] && session["devise.github_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.email_required?
    false
  end

  class << self

    def current_staff
      User.all_enabled.select { |user| user.is_current_staff? }
    end

  end

end
