class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title
      t.text :description
      t.string :type
      t.text :thumbnail
      t.text :url

      t.timestamps
    end
  end
end
