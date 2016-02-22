class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title
      t.text :description
      t.string :type
      t.text :thumbnail
      t.text :url
      t.integer :page_number
      t.string :file
      t.timestamps
    end
  end
end
