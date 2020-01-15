class PostSerializer < ActiveModel::Serializer
  attributes :id, :caption, :image, :user_name, :user_image
  
  def user_image
    object.user.user_avatar
  end

  def user_name
    object.user.full_name
  end
end
