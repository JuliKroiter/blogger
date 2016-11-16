class Admin::CommentsController < Admin::AdminController
  # def index
  # end
  #
  # def new
  # end
  #
  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params)

    redirect_to :back
  end
  #
  # def edit
  # end
  #
  # def update
  # end
  #
  # def destroy
  # end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
