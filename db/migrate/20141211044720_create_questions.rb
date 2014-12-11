class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :section, null: false, index: true
      t.references :type, null: false, index: true
      t.text :text, null: false

      t.timestamps
    end
  end
end
