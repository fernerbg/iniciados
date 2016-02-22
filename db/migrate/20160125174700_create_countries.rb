class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name, null: false
      t.string :iso, null: false 
      t.timestamps
    end
    add_index :countries, :name, unique: true
    add_index :countries, :iso, unique: true
  end
end