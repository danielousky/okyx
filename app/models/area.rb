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
class Area < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_and_belongs_to_many :services
end
