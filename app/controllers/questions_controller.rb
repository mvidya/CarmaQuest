class QuestionsController < ApplicationController
	before_action :authenticate_user!
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
	end

	def destroy
		@question.destroy
		redirect_to questions_path
	end

	def index
		@questions = Question.all
	end

	private

  def set_question
    @question = Question.find(params[:id])
  end

	def question_params
		params.require(:question).permit(:title, :description, :user_id, :team_id)
	end
end
