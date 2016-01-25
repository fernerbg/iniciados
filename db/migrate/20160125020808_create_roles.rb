class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.references :user, index: true
      t.references :profile, index: true

      t.timestamps
    end
  end
end
