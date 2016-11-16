class Admin::CommentsController < Admin::AdminController
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.create(comment_params)

    redirect_to :back
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)

    redirect_to admin_comments_path
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
