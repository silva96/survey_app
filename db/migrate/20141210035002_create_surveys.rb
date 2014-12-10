class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :name
      t.string :code
      t.text :description
      t.datetime :active_from
      t.datetime :active_until
      t.boolean :public

      t.timestamps
    end
  end
end
