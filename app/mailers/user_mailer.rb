class UserMailer < ActionMailer::Base
  default to: 'liuda315@gmail.com'

  def order_book(name, email)
    @book_name = name
    @email = email
    mail(from: email, subject: 'Заказ книги')
  end
end
