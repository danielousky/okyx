# == Schema Information
#
# Table name: services
#
#  id                           :bigint           not null, primary key
#  code                         :integer
#  condition                    :integer
#  conditions_accepted          :boolean          default(FALSE), not null
#  contact_phone                :string
#  contact_phone_code           :string
#  counter_links                :integer          default(0)
#  counter_phone                :integer          default(0)
#  counter_views                :integer          default(0)
#  details                      :string
#  link                         :string
#  location                     :string
#  name                         :string           not null
#  secundary_contact_phone      :string
#  secundary_contact_phone_code :string
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  client_id                    :bigint
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
