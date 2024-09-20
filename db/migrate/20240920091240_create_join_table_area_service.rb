class CreateJoinTableAreaService < ActiveRecord::Migration[7.0]
  def change
    create_join_table :services, :areas do |t|
      t.index [:service_id, :area_id], unique: true
    end
    # add_foreign_key :services_areas, :services, index: true
    # add_foreign_key :services_areas, :areas, index: true    
  end
end
