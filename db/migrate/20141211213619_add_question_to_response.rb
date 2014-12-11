class AddQuestionToResponse < ActiveRecord::Migration
  def change
    add_reference :responses, :question, index: true
  end
end
