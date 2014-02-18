class UserMailer < ActionMailer::Base
  default from: "from@example.com"

   def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/login'
    mail(to: @user.email, subject: 'Welcome to Old News!')
  end

  def daily_headlines(users)
    @users = User.all
    @url = "http://localhost:3000"
    mail(to: @users.email, subject: 'Daily Headlines from Old News')
  end
end
