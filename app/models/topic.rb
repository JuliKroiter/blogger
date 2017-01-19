class Topic < ActiveRecord::Base
  has_many :categories
  has_many :posts
  searchkick
end
