class Absence < ActiveRecord::Base
  enum approved: [ :pending, :accepted, :rejected ]
  belongs_to :user
end
