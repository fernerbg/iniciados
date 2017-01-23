class CreateLevelSections < ActiveRecord::Migration
  def change
    create_table :level_sections do |t|
      t.belongs_to :section, index: true
      t.belongs_to :level, index: true
      t.integer :front_number, index: true
      t.string :video_url
      t.timestamps
    end
  end
end
