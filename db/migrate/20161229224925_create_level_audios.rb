class CreateLevelAudios < ActiveRecord::Migration
  def change
    create_table :level_audios do |t|
      t.belongs_to :level, index: true
      t.belongs_to :audio, index: true
      t.integer :number
      
      t.timestamps
    end
  end
end