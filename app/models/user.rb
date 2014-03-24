class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_and_belongs_to_many :roles

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def roles?(role)
    return !!self.roles.find_by_role_name(role)
  end

end