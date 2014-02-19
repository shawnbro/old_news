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
    @users.each do |user|
    mail(to: users.email, subject: 'Daily Headlines from Old News')
    end
  end

  def send_favorite(user_id, favorite_id)
    @url = "http://localhost:3000/"
    @favorite = Favorite.find_by(id: favorite_id)
    @contacts = Contact.where(user_id: user_id)
    @contacts.each do |contact|
      mail(to: contact.email, subject: 'On this day in')
    end

  end
end
