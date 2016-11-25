class CreateLevelPages < ActiveRecord::Migration
  def change
    create_table :level_pages do |t|
      t.string :image
      t.integer :number
      t.references :level, index: true

      t.timestamps
    end
  end
end
