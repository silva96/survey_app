class Section < ActiveRecord::Base
  belongs_to :survey, inverse_of: :sections
end
