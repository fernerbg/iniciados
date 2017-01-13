class AddAttrbsToUser < ActiveRecord::Migration
  def change
  	change_table :users do |t|
	  	t.string :name
	  	t.string :surname
	  	add_reference :users, :lesson, index: true, foreign_key: true
	  	add_reference :users, :level, index: true, foreign_key: true
	  	add_reference :users, :headquarter, index: true, foreign_key: true
	  end
  end
end
