class CreateAudios < ActiveRecord::Migration
  def change
    create_table :audios do |t|
      t.string :name
      t.integer :length
      t.string :wave
      t.string :track
      t.text :description
      
      t.integer :auth_level_id, index: true, foreign_key: true
      
      t.timestamps
    end
  end
end