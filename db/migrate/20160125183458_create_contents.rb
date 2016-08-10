class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title
      t.text :description
      t.integer :page_number
      t.string :document
      t.references :tag, index: true
      t.timestamps
    end
  end
end
