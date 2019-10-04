class CreateRecommendations < ActiveRecord::Migration[6.0]
  def change
    create_table :recommendations do |t|
      t.integer :feature_id
      t.integer :sender_id
      t.integer :recipient_id

      t.timestamps
    end
  end
end
