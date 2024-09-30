class AddSeveralFieldsToService < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :details, :string
    add_column :services, :contact_phone, :string
    add_column :services, :link, :string
  end
end
