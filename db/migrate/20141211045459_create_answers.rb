class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question, null: false, index: true
      t.string :value, null: false

      t.timestamps
    end
  end
end
