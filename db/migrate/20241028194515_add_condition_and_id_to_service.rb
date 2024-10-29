class AddConditionAndIdToService < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :condition, :integer
    add_column :services, :code, :integer
  end
end
