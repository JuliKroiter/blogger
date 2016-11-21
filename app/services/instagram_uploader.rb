class InstagramUploader
  attr_accessor  :media_id, :post_params

  def initialize(id)
    @media_id = id
    media = Instagram.user_recent_media.find(media_id).first
    @post_params = {
      link: media.link,
      likes: media.likes.count,
      topic: Topic.find_by(tag: media.tags.first),
      category: Category.find_by(tag: media.tags.first),
      remote_image_url: media.images.standard_resolution.url,
      from: 'instagram'
    }
  end

  def create_post
    Post.create(post_params) if post_params['topic'] && post_params['category']
  end

  class << self
    # need authorize public_content
    # https://api.instagram.com/oauth/authorize/?client_id=CLIENT_ID&redirect_uri=REDIRECT_URI&response_type=code&scope=public_content
    def update_all
      categories = Category.all

      Topic.all.each do |topic|
        Instagram.tag_recent_media(Instagram.tag_search(topic.tag)[0].name).each do |media|

          if category = categories.find_by(tag: media.tags.last)
            post = Post.find_by(web_id: media.id)

            if post
              post.update(
                link: media.link,
                likes: media.likes.count,
                topic: topic,
                category: category,
                remote_image_url: media.images.standard_resolution.url,
                from: 'instagram'
              )
            end
          end
        end
      end
    end
  end
end