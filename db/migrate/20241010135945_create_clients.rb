class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients, id: false do |t|
      t.references :user, null: false, foreign_key: true, primary_key: true
      t.boolean :active, default: true, null: false
      t.string :origin

      t.timestamps
    end
  end
end
