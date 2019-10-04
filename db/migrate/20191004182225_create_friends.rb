class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.integer :user1_id
      t.integer :user2_id
      t.boolean :pending

      t.timestamps
    end
  end
end
