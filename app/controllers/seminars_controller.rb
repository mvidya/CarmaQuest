class SeminarsController < ApplicationController
before_filter :set_seminar, only: [:edit, :update, :show, :destroy]
   
    def new
   	 @seminar = Seminar.new
       
    end

    def show
    end

    def create
	 @seminar = Seminar.create(seminar_params)
	 @seminar[:user_id] = current_user.id
		if @seminar.save
			redirect_to @seminar, notice: 'successfully created.'
		else
			render :new, notice: 'Something went wrong'
		end
    end

	def update
		if @seminar.update(seminar_params)
			redirect_to @seminar, notice: 'successfully updated'
		else
			render :edit, notice: 'Something went wrong'
		end
	end

	def edit
        @seminar.build_document if !@seminar.document
	end

	def destroy
	    @seminar.destroy
	    redirect_to seminars_path	
	end

	def index
		if !params[:format].nil?
			@seminars = Seminar.where(team_id: params[:format])
		else
		  @seminars = Seminar.all
		 end	
	end
	private

  def set_seminar
    @seminar = Seminar.find(params[:id])
   
  end
  def seminar_params
		params.require(:seminar).permit(:title, :seminar_time, :references, :user_id, :team_id, :document)
	
	end

end
