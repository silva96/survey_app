class CreateResponseSets < ActiveRecord::Migration
  def change
    create_table :response_sets do |t|
      t.references :survey, null: false, index: true
      t.references :user, null: false, index: true
      t.boolean :incomplete, null: false, default: true

      t.timestamps
    end
  end
end
