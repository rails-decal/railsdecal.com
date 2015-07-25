# == Schema Information
#
# Table name: student_applications
#
#  id                        :integer          not null, primary key
#  first_name                :string(255)
#  last_name                 :string(255)
#  email                     :string(255)
#  phone_number              :string(255)
#  year                      :string(255)
#  major                     :string(255)
#  gpa                       :string(255)
#  why_join                  :text
#  cs_classes_taken          :text
#  current_courseload        :text
#  other_commitments         :text
#  how_did_you_hear_about_us :text
#  how_many_hours_willing    :text
#  created_at                :datetime
#  updated_at                :datetime
#  user_id                   :integer
#  semester_id               :integer
#

class StudentApplication < ActiveRecord::Base
  include StandingEnum

  enum status: [ :pending, :accepted, :rejected ]

  belongs_to :user
  belongs_to :semester

  has_many :evaluations, dependent: :destroy

  validates_presence_of :first_name, :last_name, :email, :year, :standing,
                        :major, :why_join, :cs_classes_taken, :current_courseload,
                        :other_commitments, :how_many_hours_willing, :how_did_you_hear_about_us

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  def name
    "#{first_name} #{last_name}"
  end

  def next
    # Returns nil if it cannot find the next application.
    StudentApplication.find_by_id(id + 1)
  end

  def save_and_update_user
    save && user.update(standing: standing)
  end

  def evaluations_by_users(users)
    sorted_evaluations = []
    users.each do |user|
      evaluation = evaluations.find_by_user_id(user.id)
      sorted_evaluations.push(evaluation)
    end
    sorted_evaluations
  end

  # Evaluation totals
  def total(decision)
    evaluations.where(decision: decision).count
  end

  def total_yes
    total('yes')
  end

  def total_maybe
    total('maybe')
  end

  def total_no
    total('no')
  end
end
