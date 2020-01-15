class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :full_name, :avatar

  def full_name
    object.full_name
  end

  def avatar
    "http://localhost:3000#{object.avatar}"
  end
end
