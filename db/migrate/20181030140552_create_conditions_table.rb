class CreateConditionsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :conditions do |t|
      t.integer :code    
      t.string :desc
      t.timestamps
    end
  end
end
