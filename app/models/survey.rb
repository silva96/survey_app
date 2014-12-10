class Survey < ActiveRecord::Base
  has_many :sections, inverse_of: :survey
  scope :public_surveys, -> { where(public: true) }
end
