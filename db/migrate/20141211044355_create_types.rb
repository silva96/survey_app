class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :name, limit: 20, null: false

      t.timestamps
    end
  end
end
