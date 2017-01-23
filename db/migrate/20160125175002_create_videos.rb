class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.integer :length
      t.string :cover
      t.string :track
      t.text :description

      t.timestamps
    end
  end
end
