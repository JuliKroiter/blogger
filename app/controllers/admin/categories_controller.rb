class Admin::CategoriesController < Admin::AdminController
  load_and_authorize_resource :category, param_method: :category_params, except: :topic_categories

  def create
    @category.save

    redirect_to admin_categories_path, flash: {success: "Category created"}
  end

  def update
    @category.update(category_params)

    redirect_to admin_categories_path, flash: {success: "Category updated"}
  end

  def destroy
    @category.destroy

    redirect_to admin_categories_path, flash: {success: "Category destroyed"}
  end

  def topic_categories
    @categories = Topic.find(params[:topic_id]).categories.map {|i| {id: i.id, title: i.title}}

    render json: @categories
  end

  private

  def category_params
    params.require(:category).permit(:title, :tag, :topic_id)
  end
end
