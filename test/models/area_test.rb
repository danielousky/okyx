# == Schema Information
#
# Table name: areas
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class AreaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
