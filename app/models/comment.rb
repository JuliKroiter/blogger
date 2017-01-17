class Comment < ActiveRecord::Base
  include Searchable
  belongs_to :post
end
