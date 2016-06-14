class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table :configurations do |t|
      t.text :name
      t.text :value

      t.timestamps
    end
  end
end
