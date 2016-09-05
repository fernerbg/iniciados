class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :title
      t.integer :start_page
      t.references :section, index: true

      t.timestamps
    end
  end
end
