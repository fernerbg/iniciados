class AddAttrbsToUser < ActiveRecord::Migration
  def change
  	change_table :users do |t|
	  	t.string :name
	  	t.string :surname
	  	t.string :gender
	  	t.string :aws_identity
	  	add_reference :users, :lesson, index: true
	  	add_reference :users, :level, index: true
	  	add_reference :users, :country, index: true
	  end
  end
end
