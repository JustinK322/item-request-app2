# Preview all emails at http://localhost:3000/rails/mailers/new_item_request_mailer
class NewItemRequestMailerPreview < ActionMailer::Preview
  def new_item_request_preview
    NewItemRequestMailer.new_item_request_email(User.first)
  end
end
  