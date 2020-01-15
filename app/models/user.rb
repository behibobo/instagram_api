class User < ApplicationRecord
  #Validations
  validates_presence_of :username, :password_digest
  validates :username, uniqueness: true

  #encrypt password
  has_secure_password
  has_many :posts, dependent: :destroy


  def full_name
    unless self.first_name.nil? and self.last_name.nil?
      "#{self.first_name} #{self.last_name}"
    else
      self.username
    end
  end

  def user_avatar
    unless self.avatar.nil?
      "http://localhost:3000#{self.avatar}"
    else
      "http://localhost:3000/user.png"
    end
  end

end
