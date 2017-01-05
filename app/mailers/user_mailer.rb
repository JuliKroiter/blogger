class UserMailer < ActionMailer::Base
  default to: 'liuda315@gmail.com'

  def order_book(name, email)
    @book_name = name
    mail(from: email, subject: 'Заказ книги')
  end
end
