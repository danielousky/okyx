# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  number_phone           :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # PaperTrail
  has_paper_trail on: [:create, :destroy, :update], only: [:email, :first_name, :last_name, :number_phone]
  before_create :paper_trail_create
  before_destroy :paper_trail_destroy
  before_update :paper_trail_update 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :trackable, :timeoutable, :registerable

  has_one :admin, inverse_of: :user, foreign_key: :user_id, dependent: :destroy
  accepts_nested_attributes_for :admin

  has_one :client, inverse_of: :user, foreign_key: :user_id, dependent: :destroy
  # accepts_nested_attributes_for :client

  validates :first_name, presence: true, unless: :new_record?
  validates :last_name, presence: true, unless: :new_record?
  validates :number_phone, presence: true, unless: :new_record?
  validates :profile, presence: true, unless: :new_record?

  def name
    "#{first_name} #{last_name}"
  end

  has_one_attached :profile do |attachable|
    attachable.variant :icon, resize_to_limit: [35, 35]
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end  

  def data_incompleted?
    first_name.blank? or last_name.blank? or email.blank?
  end

  private
  def paper_trail_update
    changed_fields = self.changes.keys - ['created_at', 'updated_at']
    object = I18n.t("activerecord.models.#{self.model_name.param_key}.one")
    x = []
    changed_fields.each{|field| x << I18n.t("activerecord.attributes.#{self.model_name.param_key}.#{field}")}
    self.paper_trail_event = "¡#{object} actualizado en #{x.to_sentence}"
  end   

  def paper_trail_create
    object = I18n.t("activerecord.models.#{self.model_name.param_key}.one")
    self.paper_trail_event = "¡#{object} Registrado!"
  end  

  def paper_trail_destroy
    object = I18n.t("activerecord.models.#{self.model_name.param_key}.one")
    self.paper_trail_event = "¡#{object} eliminado!"
  end  
  
end
