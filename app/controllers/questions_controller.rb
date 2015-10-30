class QuestionsController < ApplicationController
	# before_action :authenticate_user!
	before_filter :set_question, only: [:edit, :update, :show, :destroy]

	def new
		@question = Question.new
	end

	def create
		@question = Question.create(question_params)
		@question[:user_id] = current_user.id
		if @question.save
			redirect_to @question, notice: 'successfully created.'
		else
			render :new, notice: 'Something went wrong'
		end
	end

	def edit
	end

	def update
		if @question.update(question_params)
			redirect_to @question, notice: 'successfully updated'
		else
			render :edit, notice: 'Something went wrong'
		end
	end

	def show
		@answer = Answer.new
	end

	def destroy
		@question.destroy
		redirect_to questions_path
	end

	def index
		if params[:format].nil?
			@questions = Question.where(team_id: params[:format])
		else
		  @questions = Question.all
		 end	
	end

	def answer_create
		@answer = Answer.create(answer_params)
		# @question[:user_id] = current_user.id
		# @question[:question_id] = current_user.id
		# if @answer.save
		# 	redirect_to @question, notice: 'successfully created.'
		# else
		# 	render :new, notice: 'Something went wrong'
		# end
	
		@answer.save
		@question = Question.find(params[:answer][:question_id])
		@answers = @question.answers
		@answer = Answer.new
		respond_to do |format|
			format.js
		end
		# redirect_to questions_path
	end

	private

  def set_question
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

	def question_params
		params.require(:question).permit(:title, :description, :user_id, :team_id)
	end

	def answer_params
		params.require(:answer).permit(:description, :user_id, :question_id)
	end

end
