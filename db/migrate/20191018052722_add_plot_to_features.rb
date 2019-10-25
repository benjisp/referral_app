class AddPlotToFeatures < ActiveRecord::Migration[6.0]
  def change
    add_column :features, :plot, :text
  end
end
