class ChangeNullFieldsInSections < ActiveRecord::Migration
  def change
    change_column_null :sections, :survey_id, false
    change_column_null :sections, :order, false
    change_column_null :sections, :name, false
  end
end
