class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.string :entry
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
