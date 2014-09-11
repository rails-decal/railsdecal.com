# == Schema Information
#
# Table name: check_ins
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  check_in_code_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class CheckIn < ActiveRecord::Base
  belongs_to :user
  belongs_to :check_in_code
end
