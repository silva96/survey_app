class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :response_set, null: false, index: true
      t.references :answer, null: false, index: true
      t.text :text_value, null: false

      t.timestamps
    end
  end
end
