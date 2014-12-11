class Survey < ActiveRecord::Base
  has_many :sections, inverse_of: :survey
  has_many :response_sets, inverse_of: :survey
  scope :public_surveys, -> { where(public: true) }
  def to_param
    code
  end
end
