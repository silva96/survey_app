class Response < ActiveRecord::Base
  belongs_to :response_set, inverse_of: :responses
  belongs_to :answer, inverse_of: :responses
  belongs_to :question, inverse_of: :responses
end
