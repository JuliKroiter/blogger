module PostsHelper

  def count_shares post
    fb_count = HTTParty.get("http://graph.facebook.com/?id=#{post_url(post)}")
    vk_count = HTTParty.get("https://vk.com/share.php?act=count&url=#{post_url(post)}")
    twitter_count = HTTParty.get("http://public.newsharecounts.com/count.json?url=#{post_url(post)}")["count"]
    ok_count = HTTParty.get("https://ok.ru/dk?st.cmd=extOneClickLike&uid=odklocs0&ref=#{post_url(post)}")
    twitter_count
  end

end
