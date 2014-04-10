class Semester < ActiveRecord::Base
  has_many :lectures
  has_many :roles

  class << self
    def current
      last
    end
  end

end
