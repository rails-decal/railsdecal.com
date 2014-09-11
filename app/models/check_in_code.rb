# == Schema Information
#
# Table name: check_in_codes
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  class_date :date
#  created_at :datetime
#  updated_at :datetime
#

class CheckInCode < ActiveRecord::Base
  has_many :check_ins
  has_many :users, through: :check_ins

  scope :active, -> { where(enabled: true) }

  class << self
    def current
      active.last
    end
  end
end
