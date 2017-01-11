class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title
      t.string :video_url
      t.integer :start_page, index: true
      t.integer :front_number, index: true
      t.references :level, index: true
      t.timestamps
    end
  end
end
