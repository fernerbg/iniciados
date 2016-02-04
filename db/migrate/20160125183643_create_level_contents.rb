class CreateLevelContents < ActiveRecord::Migration
  def change
    create_table :level_contents do |t|
      t.belongs_to :level, index: true
      t.belongs_to :content, index: true

      t.timestamps
    end
  end
end
