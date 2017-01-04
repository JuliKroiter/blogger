class PostsController < ApplicationController
  def index
    all_posts = (params[:term].present? ? search : Post.all).includes(:category, :comments, :topic)
    all_posts = all_posts
                      .by_category(params[:category])
                      .by_topic(params[:topic])
                      .order(params[:order].blank?  ? 'created_at desc' :  'created_at ' + params[:order] )
    @posts = all_posts.site.page(params[:page]).per(6)
    @fb_posts = all_posts.facebook
    @inst_posts = all_posts.instagram
  end

  def show
    @post = Post.find(params[:id])
  end

  def create_comment
    @comment = Comment.create(comment_params)
    @post = Post.find(params[:comment][:post_id])
  end

  private

  def search
    Post.search(
      params[:term].presence || "*"
    ).records
  end

  def current_page
    @current_page = 'posts'
  end

  def comment_params
    params.require(:comment).permit(:post_id, :content)
  end

end
