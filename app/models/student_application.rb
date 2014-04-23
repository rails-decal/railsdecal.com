class StudentApplication < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :first_name, :last_name, :email, :year,
                        :major, :why_join, :cs_classes_taken, :current_courseload,
                        :other_commitments, :how_many_hours_willing, :how_did_you_hear_about_us

  def name
    '#{first_name} #{last_name}'
  end
end
