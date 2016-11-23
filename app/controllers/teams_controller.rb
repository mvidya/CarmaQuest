class TeamsController < ApplicationController
	# before_action :authenticate_user!
  before_filter :set_team, only: [:edit, :update, :show, :destroy]
  before_action :check_team_id, except: [:edit_user, :update_user]

	def new
		@team = Team.new
	end

	def create
		@team = Team.create(team_params)
		if @team.save
			redirect_to @team, notice: 'successfully created.'
		else
			render :new, notice: 'Something went wrong'
		end
	end

	def edit
	end

	def update
		if @team.update(team_params)
			redirect_to @team, notice: 'successfully updated'
		else
			render :edit, notice: 'Something went wrong'
		end
	end

	def show
	end

	def destroy
		@team.destroy
		redirect_to teams_path
	end

	def index
		@teams = Team.all
	end

	def edit_user
		@user = User.find(params[:user_id])
	end

	def update_user
		user = User.find(params[:user][:user_id])
		user.update_attributes(team_id: params[:user][:team_id])
		redirect_to root_path
	end

	private

  def set_team
    @team = Team.find(params[:id])
  end

	def team_params
		params.require(:team).permit(:name, :email)
	end

end
