class Book < ActiveRecord::Base
  include Searchable
  mount_uploader :image, ImageUploader
end
