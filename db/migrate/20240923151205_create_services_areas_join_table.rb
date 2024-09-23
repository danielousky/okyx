class CreateServicesAreasJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :services, :areas, column_options: { index: true }
  end
    # add_foreign_key :services_areas, :areas, index: true
    # add_foreign_key :services_areas, :services, index: true

end
