class UserMailer < ApplicationMailer
  default :from => "rails.carmaquest@carmatec.com"

	def new_question(user,team,q)
	  recipients = [user,team]
     @q = q
      mail(:to => recipients, :subject => "New Question is been posted have a look")
	end
  
    def new_seminar(x,y,s)
      guides = [x,y]
      @s = s
      mail(:to => guides, :subject => "New Seminar is been posted have a look") 
    end

	ActionMailer::Base.default_url_options[:host] = "localhost:3000"
end
