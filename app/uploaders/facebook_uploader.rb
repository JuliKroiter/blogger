require 'koala'

class FacebookUploader
  attr_accessor :topics, :categories, :feeds, :posts, :topic, :category, :user

  include NestedHash

  def initialize(user)
    @user = user
    @topics = Topic.all
    @categories = Category.all
    @posts = Post.facebook
    @feeds = find_feeds
  end

  def upload
    feeds.each do |feed|
      if search_tags(feed)

        post = posts.find_by(web_id: feed['id'])

        if post
          post.likes = nested_hash_value(feed, 'total_count')
          post.content = feed['message']
          post.topic = topic
          post.category = category

          post.save if post.changed
        else
          Post.create(
            web_id: feed['id'],
            content: feed['message'],
            link: feed['link'],
            likes: nested_hash_value(feed, 'total_count'),
            topic: topic,
            category: category,
            remote_image_url: feed['picture'],
            from: 'facebook'
          )
        end

        self.topic = nil
        self.category = nil
      end
    end
  end

  def search_tags(feed)
    match = /#([a-zA-Z0-9\.-]*)\s*#([a-zA-Z0-9\.-]*)\s*/.match(feed['message'])
    if match
      self.topic = topics.select { |i| i.tag ==  match[1]}.first
      self.category = categories.select { |i| i.tag ==  match[2]}.first
    end
    topic && category
  end

  def find_feeds
    client =-> (oauth_token) { Koala::Facebook::API.new(oauth_token)
                                 .get_connection('me', 'feed', :fields => "link,picture,message,likes.summary(true)") }
    provider = user.providers.find_by(provider: 'facebook')
    if provider
      begin
        client.call(provider.oauth_token)
      rescue
        client.call(provider.oauth_fb_page)
      end
    end
  end
end
