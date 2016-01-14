class TeamsController < ApplicationController
	# before_action :authenticate_user!
  before_filter :set_team, only: [:edit, :update, :show, :destroy]

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
		@teams = Team.all.paginate(:page => params[:page], :per_page => 1)
	end

	private

  def set_team
    @team = Team.find(params[:id])
  end

	def team_params
		params.require(:team).permit(:name, :email)
	end

end
