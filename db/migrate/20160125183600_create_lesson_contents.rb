class CreateLessonContents < ActiveRecord::Migration
  def change
    create_table :lesson_contents do |t|
      t.belongs_to :lesson, index: true
      t.belongs_to :content, index: true

      t.timestamps
    end
  end
end
