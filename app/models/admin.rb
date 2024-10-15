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
  enum role: {desarrollador: 0, super: 1, analista: 2, administrativo: 3}
  belongs_to :user

  def is_boss?
    (desarrollador? or super?)
  end
end
