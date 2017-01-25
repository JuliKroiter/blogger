class UserMailer < ActionMailer::Base
  default to: 'liuda315@gmail.com'

  def order_book name, email
    @book_name = name
    @email = email
    mail(from: email, subject: 'Заказ книги')
  end

  def order_consultation email, subject
    @email = email
    mail(from: email, subject: subject)
  end

  def free_planer email
    @email = email
    mail(from: email, subject: 'Планер в подарок')
  end

  def contact_me name, email
    @name = name
    @email = email
    mail(from: email, subject: 'Сотрудничество')
  end
end
