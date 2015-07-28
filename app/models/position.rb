# == Schema Information
#
# Table name: positions
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  name       :string
#

class Position < ActiveRecord::Base
  has_many :roles
end
