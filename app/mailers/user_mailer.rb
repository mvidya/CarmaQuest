class UserMailer < ApplicationMailer
  default :from => "rails.carmaquest@carmatec.com"

	def new_question(user,team)
	  recipients = [user,team]
      mail(:to => recipients, :subject => "New Question is been posted have a look")
	end
  
  def new_seminar(x,y)
    guides = [x,y]
    mail(:to => guides, :subject => "New Seminar is been posted have a look") 
  end 

  def user_registration_mail_facebook(user, pw)
    @password = pw
    @user = user
    mail(:to => @user.email, :subject => "Facebook registration")
  end

	ActionMailer::Base.default_url_options[:host] = "localhost:3000"
end
