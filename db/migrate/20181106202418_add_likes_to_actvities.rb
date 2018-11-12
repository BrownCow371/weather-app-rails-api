class AddLikesToActvities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :likes, :integer, :default => 0
  end
end
