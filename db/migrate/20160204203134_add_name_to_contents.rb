class AddNameToContents < ActiveRecord::Migration
  def change
  	change_table :contents do |t|
	  	t.string :name
	  end
  end
end