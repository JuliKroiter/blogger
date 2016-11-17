class Admin::CategoriesController < Admin::AdminController
  load_and_authorize_resource :category, param_method: :category_params

  def create
    @category.save

    redirect_to admin_categories_path
  end

  def update
    @category.update(category_params)

    redirect_to admin_categories_path
  end

  def destroy
    @category.destroy

    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
