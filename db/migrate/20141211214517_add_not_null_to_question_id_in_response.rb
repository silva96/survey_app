class AddNotNullToQuestionIdInResponse < ActiveRecord::Migration
  def change
    change_column_null :responses, :question_id, false
  end
end
