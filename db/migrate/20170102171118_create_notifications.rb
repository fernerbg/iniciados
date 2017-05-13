class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :title
      t.datetime :start_date, index: true
      t.datetime :end_date
      t.text :description
      t.string :media
      t.text :link
      t.timestamps
    end
  end
end