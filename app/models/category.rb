class Category < ActiveRecord::Base
  has_many :posts, dependent: :nullify
  belongs_to :topic
end
