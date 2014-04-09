class Semester < ActiveRecord::Base
  has_many :lectures
end
