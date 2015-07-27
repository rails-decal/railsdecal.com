# == Schema Information
#
# Table name: check_in_codes
#
#  id         :integer          not null, primary key
#  code       :string
#  class_date :date
#  created_at :datetime
#  updated_at :datetime
#  enabled    :boolean          default(FALSE)
#

require 'spec_helper'

describe CheckInCode do
  pending "add some examples to (or delete) #{__FILE__}"
end
