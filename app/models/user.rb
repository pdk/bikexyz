class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role
  # attr_accessible :title, :body
  
  def role?(to_check=nil)
    if to_check.nil?
      self.role.to_sym
    else
      to_check.to_sym == self.role.to_sym
    end
  end
  
  def admin?
    self.role? :admin
  end
  
  def just_user?
    self.role? :user
  end
    
end
