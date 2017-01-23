class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title
      t.integer :start_page, index: true
      t.integer :book_id, index: true
      t.timestamps
    end
  end
end