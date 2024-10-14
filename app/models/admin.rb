# == Schema Information
#
# Table name: admins
#
#  active     :boolean
#  role       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null, primary key
#
# Indexes
#
#  index_admins_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Admin < ApplicationRecord
  belongs_to :user
end
