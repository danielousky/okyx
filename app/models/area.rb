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

    # PaperTrail
    has_paper_trail on: [:create, :destroy, :update]
    before_create :paper_trail_create
    before_destroy :paper_trail_destroy
    before_update :paper_trail_update 
    
    validates :name, presence: true, uniqueness: true
    has_and_belongs_to_many :services

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
