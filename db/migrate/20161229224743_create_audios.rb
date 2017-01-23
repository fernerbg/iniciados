class CreateAudios < ActiveRecord::Migration
  def change
    create_table :audios do |t|
      t.string :name
      t.integer :length
      t.string :wave
      t.string :track
      t.text :description
      
      t.timestamps
    end
  end
end