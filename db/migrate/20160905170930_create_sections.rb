class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title
      t.string :video_url
      t.integer :start_page
      t.references :level, index: true

      t.timestamps
    end
  end
end
