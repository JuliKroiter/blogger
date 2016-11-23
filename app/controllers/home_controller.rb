class HomeController < ApplicationController
  def index
    all_posts = params[:term].present? ? search : Post.all
    @posts = all_posts.site.page(params[:page]).per(6)
    @fb_posts = all_posts.facebook
    @inst_posts = all_posts.instagram
  end

  private

  def search
    Post.search(
      params[:term].presence || "*"
    ).records
  end
end
