namespace :import do
  desc "Import posts from different sites"
  task :import_posts => :environment do
    require 'nokogiri'
    require 'sanitize'
    require 'open-uri'
    require 'roo'
      xlsx = Roo::Excelx.new("./posts.xlsx")
      xlsx.sheet(0).drop(1).first(60).each do |row|
        url = row[0]
        topic = Topic.find_by_title(row[1].mb_chars.capitalize)
        category = Category.find_by_title(row[2].mb_chars.capitalize)
        doc = Nokogiri::HTML(open(url))
        image = doc.at_css('.post-single-content').children.xpath('//img').first.attr('src') rescue nil
        title = doc.at_css(".single-title").text
        content = doc.at_css(".post-single-content").to_html
        post = Post.create(title: title, content: content, remote_image_url: image,
                           topic_id: topic.try(:id), category_id: category.try(:id))
      end
      xlsx.sheet(0).drop(60).each do |row|
        url = row[0]
        topic = Topic.find_by_title(row[1].mb_chars.capitalize)
        category = Category.find_by_title(row[2].mb_chars.capitalize) rescue nil
        doc = Nokogiri::HTML(open(url))
        image = doc.at_css('.entry-featured-media-boxed').children.xpath('//img').first.attr('src') rescue nil
        title = doc.at_css(".g1-mega.g1-mega-1st.entry-title").text
        content = doc.at_css(".entry-content").to_html
        post = Post.create(title: title, content: content, remote_image_url: image,
                           topic_id: topic.try(:id), category_id: category.try(:id))
      end
    end
end
