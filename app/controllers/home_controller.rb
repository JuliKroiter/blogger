class HomeController < ApplicationController

  before_action :set_subject, only: :order_consultation

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

  def order_consultation
    email = params[:email]
    UserMailer.order_consultation(email, @subject).deliver_now
  end

  def free_planer
    email = params[:email]
    UserMailer.free_planer(email).deliver_now
  end

  def contact_me
    name = params[:name]
    email = params[:email]
    UserMailer.contact_me(name, email).deliver_now
  end

  def polygraphy
    @current_page = 'polygraphy'
  end

  def feedbacks
    @feedbacks = Feedback.all.page(params[:page]).per(5)
  end

  def get_feedback
    @feedback = Feedback.find(params[:id])
    render json: @feedback
  end

  private

  def set_subject
    if !params[:learn_more].blank?
      @subject = 'Узнать больше'
    elsif !params[:mom_plan].blank?
      @subject = 'Мама-план. Узнать больше.'
    else
      @subject = 'Заказ консультации'
    end
  end
end
