class Lecture < ActiveRecord::Base

  def filename
    "lectures/#{year}/#{semester.downcase}/#{partial.downcase}"
  end

end
