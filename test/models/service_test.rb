# == Schema Information
#
# Table name: services
#
#  id                 :bigint           not null, primary key
#  code               :integer
#  condition          :integer
#  contact_phone      :string
#  contact_phone_code :string
#  details            :string
#  link               :string
#  location           :string
#  name               :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  client_id          :bigint
#
# Indexes
#
#  index_services_on_client_id  (client_id)
#
# Foreign Keys
#
#  fk_rails_...  (client_id => clients.user_id)
#
require "test_helper"

class ServiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
