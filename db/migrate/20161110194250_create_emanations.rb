class CreateEmanations < ActiveRecord::Migration
  def change
    create_table :emanations do |t|
      t.string :image_url
      t.text :message
      t.string :title
      t.references :level, index: true

      t.timestamps
    end
  end
end
