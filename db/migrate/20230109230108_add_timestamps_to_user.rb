class AddTimestampsToUser < ActiveRecord::Migration[5.2]
  def change_table
    add_column :users, :created_at, :datetime, null: false
    add_column :users, :updated_at, :datetime, null: false
  end
end
