class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name, unique: true
      t.text :description
      t.integer :number_level
      t.integer :number, unique: true
      t.belongs_to :lesson_level, index: true

      t.timestamps
    end
  end
end
