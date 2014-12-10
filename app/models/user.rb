class User < ActiveRecord::Base

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
    self.role_id ||=Role.find_by_name('user')
  end
end
