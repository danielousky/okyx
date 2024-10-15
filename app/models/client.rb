# == Schema Information
#
# Table name: clients
#
#  active     :boolean          default(TRUE), not null
#  origin     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null, primary key
#
# Indexes
#
#  index_clients_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Client < ApplicationRecord
  belongs_to :user
  accepts_nested_attributes_for :user

  has_many :services
end
