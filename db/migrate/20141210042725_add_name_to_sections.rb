class AddNameToSections < ActiveRecord::Migration
  def change
    add_column :sections, :name, :string, limit: 20
  end
end
