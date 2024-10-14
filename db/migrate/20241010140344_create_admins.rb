class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins, id: false do |t|
      t.references :user, null: false, foreign_key: true, primary_key: true
      t.boolean :active
      t.integer :role

      t.timestamps
    end
  end
end
