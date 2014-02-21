class UserMailer < ActionMailer::Base
  include ArticleHelper

  default from: "from@example.com"

   def welcome_email(user)
    @articles = generate_date
    @user = user
    @url  = 'http://oldnewsapp.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome to Old News!')
  end

  def daily_headlines(users)
    @articles = generate_date
    @users = User.all
    @url = "http://oldnewsapp.herokuapp.com/"
    @users.each do |user|
    mail(to: users.email, subject: 'Daily Headlines from Old News')
    end
  end

  def send_favorite(user_id, favorite_id)
    @url = "http://oldnewsapp.herokuapp.com/"
    @favorite = Favorite.find_by(id: favorite_id)
    @contacts = Contact.where(user_id: user_id)
    @contacts.each do |contact|
      mail(to: contact.email, subject: 'On this day in')
    end
  end

end
