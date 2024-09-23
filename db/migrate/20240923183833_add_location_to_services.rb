class AddLocationToServices < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :location, :string   
  end
end
