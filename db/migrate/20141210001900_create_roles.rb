class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name, null: false, limit: 20
      t.timestamps
    end
  end
end
