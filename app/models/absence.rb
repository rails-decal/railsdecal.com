# == Schema Information
#
# Table name: absences
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  excuse     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  approved   :integer          default(0)
#

class Absence < ActiveRecord::Base
  enum approved: [ :pending, :accepted, :rejected ]
  belongs_to :user
end
