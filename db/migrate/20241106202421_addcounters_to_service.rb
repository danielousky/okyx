class AddcountersToService < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :counter_views, :integer, default: 0
    add_column :services, :counter_phone, :integer, default: 0
    add_column :services, :counter_links, :integer, default: 0
  end
end
