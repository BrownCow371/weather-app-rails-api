class CreateActivityConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_conditions do |t|
      t.integer :condition_id
      t.integer :activity_id
      t.timestamps
    end
  end
end
