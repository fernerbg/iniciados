class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.string :name, unique: true
      t.string :value
      t.integer :number, unique: true
      t.timestamps
    end
  end
end
