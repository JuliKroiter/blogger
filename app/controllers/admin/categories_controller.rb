class Admin::CategoriesController < Admin::AdminController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)

    redirect_to admin_categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)

    redirect_to admin_categories_path
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
