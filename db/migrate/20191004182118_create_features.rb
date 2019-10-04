class CreateFeatures < ActiveRecord::Migration[6.0]
  def change
    create_table :features do |t|
      t.string :title
      t.string :year
      t.string :type
      t.string :imdb_id
      t.string :poster

      t.timestamps
    end
  end
end
