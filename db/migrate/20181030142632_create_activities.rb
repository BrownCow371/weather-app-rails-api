class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :desc
      t.integer :max_temp
      t.integer :min_temp
      t.integer :max_wind_speed
      t.timestamps
    end
  end
end
