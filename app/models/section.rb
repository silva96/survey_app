class Section < ActiveRecord::Base
  belongs_to :survey, inverse_of: :sections
  has_many :questions, inverse_of: :section
  validates :name, uniqueness: { scope: :survey }
  validates :name, presence: true
  validates :order, uniqueness: { scope: :survey }
  validates :order, presence: true
  before_create :assign_slug
  before_update :assign_slug
  def to_param
    slug
  end
  private
  def assign_slug
    self.slug ||=self.name.parameterize
  end

end
