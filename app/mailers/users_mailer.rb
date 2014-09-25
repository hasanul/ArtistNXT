class UsersMailer < ActionMailer::Base

  def welcome_message(user, password)
    @user = user
    @password = password
    mail(:to => user.email,
         :subject => 'Welcome to ArtistNXT')
  end
  def payment_complete_message(user)
    @user = user
    
    mail(:to => user.email,
         :subject => 'Welcome to ArtistNXT')
  end
  def music_purchase_completed(user,musicList)
    @user = user
    @musicList = musicList
    mail(:to => user.email,
         :subject => 'Your music list to ArtistNXT')
  end
end