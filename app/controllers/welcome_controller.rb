class WelcomeController < ApplicationController
	 #before_action :authenticate_user!
	before_action :check_team_id
  
  def index
  	@teams = Team.all
  end
  
end
