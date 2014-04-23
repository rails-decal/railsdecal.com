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
#  first_name             :string(255)
#  last_name              :string(255)
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
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:github]

  has_many :roles
  has_many :student_applications

  extend FriendlyId
  friendly_id :nickname

  def first_name
    if name
      name.split(' ').first
    else
      ''
    end
  end

  def last_name
    if name
      name.split(' ').last
    else
      ''
    end
  end

  def current_role
    self.roles.where(semester: Semester.current).first
  end

  def add_role_for_semester(role_name, semester)
    self.enabled = true
    current_role = self.roles.where(semester: Semester.current)
    position = Position.find_by(name: role_name)
    if current_role
      current_role.update(position: position)
    else
      self.roles.where(semester: Semester.current, position: position).first_or_create
    end
    self.save!
  end

  def add_role_for_current_semester(role_name)
    add_role_for_semester(role_name, Semester.current)
  end

  def is_staff?
    self.current_role.name == "Instructor" || self.current_role.name == "TA"
  end

  def submitted_current_semester_application?
    unless student_applications.where(semester: Semester.current).nil?
      true
    else
      false
    end
  end

  def self.find_for_github_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
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

end
