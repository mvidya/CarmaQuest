class UserMailer < ApplicationMailer
  default :from => "rails.carmaquest@carmatec.com"

	def new_question(email)
	  email = 'gouravracer@gmail.com' #have to change this email
      mail(:to => email, :subject => "New Question is been posted have a look")
	end
  
	ActionMailer::Base.default_url_options[:host] = "localhost:3000"
end
