class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, index: true
      t.text :description
      t.references :authority, polymorphic: true, index: true
      
      t.timestamps
    end
  end
end