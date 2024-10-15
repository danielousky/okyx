class AddClientToService < ActiveRecord::Migration[7.0]
  def change
    add_reference :services, :client, index: true, foreign_key: {primary_key: :user_id}
  end
end
