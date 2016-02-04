class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.text :description
      t.integer :number_level
      t.integer :number
      t.belongs_to :lesson_level, index: true

      t.timestamps
    end
  end
end
