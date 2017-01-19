class PostsController < ApplicationController
  impressionist actions: [:show]

  def index
    all_posts = Post.all.includes(:category, :comments, :topic)
    all_posts = all_posts
                      .by_category(params[:category])
                      .by_topic(params[:topic])
                      .order(params[:order].blank?  ? 'created_at desc' :  'created_at ' + params[:order] )
    @posts = all_posts.site.page(params[:page]).per(6)
    @fb_posts = all_posts.facebook.last(4)
    @inst_posts = all_posts.instagram.last(4)
    render params[:page].present? ? 'more_pages' : 'index'
  end

  def show
    @post = Post.find(params[:id])
  end

  def create_comment
    cp = comment_params
    cp[:commenter] = cp[:commenter].blank? ? 'Аноним' : cp[:commenter]
    @comment = Comment.create(cp)
    @post = Post.find(params[:comment][:post_id])
  end

  private

  def current_page
    @current_page = 'posts'
  end

  def comment_params
    params.require(:comment).permit(:post_id, :content, :commenter)
  end

end
