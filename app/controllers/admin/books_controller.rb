class Admin::BooksController < Admin::AdminController
  load_and_authorize_resource :book, param_method: :book_params

  def create
    @book.save

    redirect_to admin_books_path, flash: {success: "Book created"}
  end

  def update
    @book.update(book_params)

    redirect_to admin_books_path, flash: {success: "Book updated"}
  end

  def destroy
    @book.destroy

    redirect_to admin_books_path, flash: {success: "Book destroyed"}
  end

  private

  def book_params
    params.require(:book).permit(:title, :content, :image, :remove_image, :price,
                                 :buy_ua_link, :buy_ozon_link, :buy_labirint_link,
                                 :buy_e_link, :buy_bel_link )
  end
end
