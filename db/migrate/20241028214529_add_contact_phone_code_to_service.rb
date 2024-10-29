class AddContactPhoneCodeToService < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :contact_phone_code, :string
  end
end
