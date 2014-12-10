class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :survey, index: true
      t.integer :order

      t.timestamps
    end
  end
end
