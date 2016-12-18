class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :image
      t.integer :number
      t.belongs_to :level_page, index: true

      t.timestamps
    end
  end
end
