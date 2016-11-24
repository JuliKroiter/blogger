class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :category
  belongs_to :topic

  mount_uploader :image, ImageUploader

  accepts_nested_attributes_for :comments, reject_if: :all_blank, allow_destroy: true

  enum from: [:site, :instagram, :facebook]

  searchkick

  def search_data
    {
      title: title,
      content: content,
      topic: topic.try(:title),
      category: category.try(:title)
    }
  end
end
