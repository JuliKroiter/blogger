class Book < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  searchkick
end
