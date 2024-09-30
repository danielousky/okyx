class Service < ApplicationRecord
    has_and_belongs_to_many :areas
    accepts_nested_attributes_for :areas, reject_if: ->(attributes){ attributes['name'].blank? }, allow_destroy: true

	has_rich_text :description
	validates :name, presence: true
	validates :details, presence: true
	# validates :description, presence: true
	validates :areas, presence: true
	validates :location, presence: true
	validates :profile, presence: true

    has_one_attached :profile do |attachable|
        attachable.variant :icon, resize_to_limit: [35, 35]
        attachable.variant :thumb, resize_to_limit: [100, 100]
    end

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
end
