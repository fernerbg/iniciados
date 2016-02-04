class CreateLessonLevels < ActiveRecord::Migration
  def change
    create_table :lesson_levels do |t|
      t.string :name

      t.timestamps
    end
  end
end
