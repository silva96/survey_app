class User < ActiveRecord::Base
  belongs_to :role, inverse_of: :users
  has_many :response_sets, inverse_of: :user
  before_create :set_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def admin?
    self.role.name == 'admin'
  end
  private
  def set_default_role
    self.role ||=Role.find_by_name('user')
  end
end
