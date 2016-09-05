class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title
      t.integer :start_page
      t.references :level, index: true

      t.timestamps
    end
  end
end
