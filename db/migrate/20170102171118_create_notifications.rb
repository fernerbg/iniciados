class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :title
      t.datetime :date
      t.text :description
      t.string :media

      t.timestamps
    end
  end
end
