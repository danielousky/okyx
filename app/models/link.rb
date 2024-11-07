# == Schema Information
#
# Table name: links
#
#  id         :bigint           not null, primary key
#  type_link  :integer          default(0), not null
#  url        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :bigint           not null
#
# Indexes
#
#  index_links_on_service_id  (service_id)
#
# Foreign Keys
#
#  fk_rails_...  (service_id => services.id)
#
class Link < ApplicationRecord
  belongs_to :service#, counter_cache: true

  # PaperTrail
  has_paper_trail on: [:create, :destroy, :update]
  before_create :paper_trail_create
  before_destroy :paper_trail_destroy
  before_update :paper_trail_update

  # Variables:
  enum type_link: {web: 0, instagram: 1, youtube: 2, facebook: 3, twitter: 4, telegram: 5, tik_tok: 6, linked_in: 7, otro: 8}
  # attr_accessor :destroy
  
  # Validations:
  validates :url, presence: true
  validates :type_link, presence: true
  validates :service, presence: true

  # Scopes:

  # Methods:

  def to_link_with_icon
    "<a href='#{self.url}' target='_blank' class='btn btn-sm btn-info mx-2'><i class='fa-brands fa-#{self.type_link}'></i> #{self.url}</a>".html_safe
  end
  # Callbacks:
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
