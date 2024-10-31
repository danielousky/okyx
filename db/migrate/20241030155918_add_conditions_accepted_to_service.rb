class AddConditionsAcceptedToService < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :conditions_accepted, :boolean, default: false, null: false
  end
end
