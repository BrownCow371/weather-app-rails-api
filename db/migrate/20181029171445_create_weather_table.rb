class CreateWeatherTable < ActiveRecord::Migration[5.2]
  def change
    create_table :weathers do |t|
      t.string :zip
      t.string :date
      t.string :main 
      t.string :desc
      t.string :icon
      t.integer :code
      t.float :temp
      t.float :humidity
      t.float :wind_speed
      t.timestamps
    end
  end
end
