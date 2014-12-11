class ResponseSet < ActiveRecord::Base
  belongs_to :survey, inverse_of: :response_sets
  belongs_to :user, inverse_of: :response_sets
  has_many :responses, inverse_of: :response_set,:dependent => :destroy
end
