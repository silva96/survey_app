class Type < ActiveRecord::Base
  has_many :questions, inverse_of: :type
end
