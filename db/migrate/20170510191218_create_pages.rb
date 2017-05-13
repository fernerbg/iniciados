class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :number, index: true
      t.string :image
      t.belongs_to :book, index: true
      
      t.timestamps
    end
  end
end