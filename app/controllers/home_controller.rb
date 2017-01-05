class HomeController < ApplicationController
  def index
  end

  def about
    @current_page = 'about'
  end

  def partners
    @current_page = 'partners'
  end

  def order_book
    book_name = Book.find(params[:book_id]).title
    email = params[:email]
    UserMailer.order_book(book_name, email).deliver_now
  end
end
