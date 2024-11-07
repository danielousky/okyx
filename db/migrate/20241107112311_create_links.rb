class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.integer :type_link, default: 0, null: false
      t.string :url, null: false
      t.belongs_to :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
