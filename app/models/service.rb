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
class Service < ApplicationRecord
  
  # PaperTrail
  has_paper_trail on: [:create, :destroy, :update]
  before_create :paper_trail_create
  before_destroy :paper_trail_destroy
  before_update :paper_trail_update  
  
  # Associations:
  has_and_belongs_to_many :areas
  accepts_nested_attributes_for :areas, reject_if: ->(attributes){ attributes['name'].blank? }, allow_destroy: true
  belongs_to :client, optional: true

  # Variables:
  has_rich_text :description
  has_one_attached :profile do |attachable|
      attachable.variant :icon, resize_to_limit: [35, 35]
      attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  enum condition: {V: 0, E: 1, J: 2, G: 3}

  # Validations:
	validates :name, presence: true, uniqueness: {case_sensitive: false}
	validates :details, presence: true
	# Atención: Estas validaciones fueron comentadas temporalmente para la carga inicial de servicios
  # validates :condition, presence: true
	# validates :code, presence: true
	validates :areas, presence: true
	validates :location, presence: true
	validates :profile, presence: true
	validates :contact_phone_code, presence: true
	validates :contact_phone, presence: true
	validates :conditions_accepted, presence: true

  # Scope:
  scope :search_by, -> (value) {where("name ILIKE '%#{value}%' OR details ILIKE '%#{value}%'")}
  scope :names, -> {select(:name).map{|ar| ar.name}}
  scope :by_state, -> (state) {where(location: state)}
  
  # Functions:
  def self.venezuela
      require 'json'
      file = File.read("#{Rails.root}/public/venezuela.json")
      JSON.parse(file)
  end    
  def self.states
      venezuela.map{|a| a["estado"]}
  end

  # def profile_as_thumb
  #     begin
  #       profile.variant(resize_to_limit: [100, 100]).processed
  #     rescue Exception => e
        
  #     end
  # end    
  # def profile_as_icon
  #     begin
  #       profile.variant(resize_to_limit: [35, 35]).processed
  #     rescue Exception => e
        
  #     end
  # end
    
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
