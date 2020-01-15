class Image < ApplicationRecord
  mount_uploader :name, ImageUploader
  belongs_to :user, optional: true
end
