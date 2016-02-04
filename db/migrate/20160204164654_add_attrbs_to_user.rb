class AddAttrbsToUser < ActiveRecord::Migration
  def change
  	change_table :users do |t|
	  	t.string :name
	  	t.string :surname
	  	add_reference :users, :lesson, index: true
	  	add_reference :users, :level, index: true
	  	t.string :gender
	  end
  end
end
