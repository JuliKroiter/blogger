class Admin::PostsController < Admin::AdminController
  load_and_authorize_resource :post, param_method: :post_params

  def new
    @post.comments.new
  end

  def create
    @post.save

    redirect_to admin_posts_path, flash: {success: "User created"}
  end

  def update
    @post.update(post_params)

    redirect_to admin_posts_path, flash: {success: "User updated"}
  end

  def destroy
    @post.destroy

    redirect_to admin_posts_path, flash: {success: "User destroyed"}
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image, :remove_image, :topic_id, :category_id, comments_attributes: [:content])
  end
end
