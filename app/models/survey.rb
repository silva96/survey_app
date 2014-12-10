class Survey < ActiveRecord::Base
  has_many :sections, inverse_of: :survey
end
