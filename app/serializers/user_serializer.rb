class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :full_name, :avatar

  def full_name
    object.full_name
  end

  def avatar
    object.user_avatar
  end
end
