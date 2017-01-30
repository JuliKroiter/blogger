class Admin::AuthorsController < Admin::AdminController
  load_and_authorize_resource :author, param_method: :author_params

  def create
    @author.save

    redirect_to admin_authors_path, flash: {success: "Author created"}
  end

  def update
    @author.update(author_params)

    redirect_to admin_authors_path, flash: {success: "Author updated"}
  end

  def destroy
    @author.destroy

    redirect_to admin_authors_path, flash: {success: "Author destroyed"}
  end

  private

  def author_params
    params.require(:author).permit(:name, :picture, :description, :fb_link)
  end
end
