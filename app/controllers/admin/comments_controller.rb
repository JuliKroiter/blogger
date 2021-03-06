class Admin::CommentsController < Admin::AdminController
  load_and_authorize_resource :comment, except: [:create]

  def create
    @comment = Comment.create(comment_params)

    redirect_to :back, flash: {success: "Comment created"}
  end

  def update
    @comment.update(comment_params)

    redirect_to admin_comments_path, flash: {success: "Comment updated"}
  end

  def destroy
    @comment.destroy

    redirect_to :back, flash: {success: "Comment destroyed"}
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
