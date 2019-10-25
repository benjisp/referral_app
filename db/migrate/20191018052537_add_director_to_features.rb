class AddDirectorToFeatures < ActiveRecord::Migration[6.0]
  def change
    add_column :features, :director, :string
  end
end
