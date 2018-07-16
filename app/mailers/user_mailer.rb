class UserMailer < ApplicationMailer
  default from: 'dry-operation@example.com'
   
  def sign_up_email(user_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
