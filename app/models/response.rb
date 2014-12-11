class Response < ActiveRecord::Base
  belongs_to :response_set
  belongs_to :answer
end
