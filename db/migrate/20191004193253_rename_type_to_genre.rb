class RenameTypeToGenre < ActiveRecord::Migration[6.0]
  def change
    rename_column :features, :type, :genre
  end
end
