class Section < ActiveRecord::Base
  belongs_to :survey, inverse_of: :sections
  validates :name, uniqueness: { scope: :survey }
  validates :name, presence: true
  validates :order, uniqueness: { scope: :survey }
  validates :order, presence: true

end
