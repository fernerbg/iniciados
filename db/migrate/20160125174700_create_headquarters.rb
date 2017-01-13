class CreateHeadquarters < ActiveRecord::Migration
  def change
    create_table :headquarters do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end