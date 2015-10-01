class AddsColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :image_url, :string
    add_column :users, :bio, :string
  end
end
