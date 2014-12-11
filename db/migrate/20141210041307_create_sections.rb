class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :survey, index: true, :null => false
      t.integer :order
      t.string :slug, null: false
      t.timestamps
    end
  end
end
