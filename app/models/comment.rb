class Comment < ActiveRecord::Base
  belongs_to :post
  searchkick
end
