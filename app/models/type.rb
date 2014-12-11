class Type < ActiveRecord::Base
  has_many :questions, inverse_of: Type
end
