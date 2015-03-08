class ItemRequestMailer < ActionMailer::Base

  def new_item_request_email( from_user)
    @email_to = 'jjk.plannr.com@gmail.com'
    @email_from = from_user.email
    @url_item_requests = 'http://localhost:3000/item_requests'
    mail(to: @email_to, subject: 'New Item Request for Review', from: @email_from)
  end

  def request_declined_email(item_request, to_user)
    @item_request = item_request
    @email_to = to_user.email
    @email_from =  'jjk.plannr.com@gmail.com'
    @url_item_requests = 'http://localhost:3000/item_requests'
    mail(to: @email_to, subject: 'Item Request Declined', from: @email_from)
  end

  def request_accepted_email(item_request, to_user)
    @item_request = item_request
    @email_to = to_user.email
    @email_from =  'jjk.plannr.com@gmail.com'
    @url_item_requests = 'http://localhost:3000/item_requests'
    mail(to: @email_to, subject: 'Item Request Approved', from: @email_from)
  end
end
  