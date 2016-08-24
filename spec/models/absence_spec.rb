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

require 'spec_helper'

describe Absence do
  pending "add some examples to (or delete) #{__FILE__}"
end
