class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :display_name, 
    format: { with: /\A[a-zA-Z ]+\z/, message: "only letters and space allowed" }
  validates :email, 
  	format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "is in invalid format" }

  def role?(role)
    return !!self.roles.find_by_name(role.to_s)
  end
end

