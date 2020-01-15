class User < ApplicationRecord
  #Validations
  validates_presence_of :username, :password_digest
  validates :username, uniqueness: true

  #encrypt password
  has_secure_password

  def full_name
    if self.first_name != "" and self.last_name != "" 
      "#{self.first_name} #{self.last_name}"
    else
      self.username
    end
  end

  def user_avatar
    if avatar != "" 
      "http://localhost:3000#{self.avatar}"
    else
      "http://localhost:3000/user.png"
    end
  end

end
