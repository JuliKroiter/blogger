class Author < ActiveRecord::Base
  mount_uploader :picture, ImageUploader
  has_many :posts
end
