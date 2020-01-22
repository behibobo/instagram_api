class PostSerializer < ActiveModel::Serializer
  attributes :id, :caption, :image, :user_name, 
  :user_image, :like_count, :like_by_user
  
  def image
    "http://176.9.164.199:3004#{object.image}"
  end

  def user_image
    object.user.user_avatar
  end

  def user_name
    object.user.full_name
  end

  def like_count
    object.like_count
  end

  def like_by_user
    !object.post_likes.find_by(user: current_user).nil?
  end
end
