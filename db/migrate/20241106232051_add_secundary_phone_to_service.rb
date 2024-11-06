class AddSecundaryPhoneToService < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :secundary_contact_phone, :string
    add_column :services, :secundary_contact_phone_code, :string
  end
end
