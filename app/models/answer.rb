class Answer < ActiveRecord::Base
  belongs_to :question, inverse_of: :answers
  has_many :responses, inverse_of: :answer
end
