class UpdateColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :recipes, :source, :label
    rename_column :recipes, :url, :uri
  end
end
