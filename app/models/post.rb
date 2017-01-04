class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :category
  belongs_to :topic

  mount_uploader :image, ImageUploader

  accepts_nested_attributes_for :comments, reject_if: :all_blank, allow_destroy: true

  enum from: [:site, :instagram, :facebook]
  scope :by_category, -> (category_id) { where(category_id: category_id) unless category_id.blank?}
  scope :by_topic, -> (topic_id) { where(topic_id: topic_id) unless topic_id.blank?}

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
