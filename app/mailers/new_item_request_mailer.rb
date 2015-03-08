class NewItemRequestMailer < ActionMailer::Base
  default from: @user.email

  def new_item_request_email(user)
    @user = user
    @url_item_requests = 'http://localhost:3000/item_requests'
    mail(to: 'jjk.plannr.com@gmail.com', subject: 'New Item Request')
  end

end
  