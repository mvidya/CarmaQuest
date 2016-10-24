class QuestionsController < ApplicationController
	# before_action :authenticate_user!
	before_filter :set_question, only: [:edit, :update, :show, :destroy, :upvote, :downvote]
   
	def new
		@question = Question.new
		@question.build_document
	end

	def create
		@question = Question.create(question_params)
		@question[:user_id] = current_user.id
		if @question.save
			user = current_user.email
			team = Team.find(params[:question][:team_id]).email
			UserMailer.new_question(user,team,@question).deliver!
			redirect_to @question, notice: 'successfully created.'
		else
			render :new, notice: 'Something went wrong'
		end
	end

	def edit
		@question.build_document if !@question.document
	end

	def update
		if @question.update(question_params)
			redirect_to @question, notice: 'successfully updated'
		else
			render :edit, notice: 'Something went wrong'
		end
	end

	def show
		impressionist(@question)
		   @answer = Answer.new
		unless @question.user == current_user
           @question.save
        end
	end

	def destroy
		@question.destroy
		redirect_to questions_path
	end

	def index
		if !params[:format].nil?
		   @questions = Question.where(team_id: params[:format])
		else
           @questions = Question.all
        end
	end

	def answer_create
		@answer = Answer.create(answer_params)	
		@answer.save
		@question = Question.find(params[:answer][:question_id])
		@answers = @question.answers
		@answer = Answer.new
		respond_to do |format|
			format.js
		end
	end

	def upvote
        @question.upvote_from current_user
        redirect_to questions_path
    end

    def downvote
        @question.downvote_from current_user
        redirect_to questions_path
    end

	private

    def set_question
        @question = Question.find(params[:id])
        @answers = @question.answers
    end

	def question_params
		params.require(:question).permit(:title, :description, :user_id, :team_id, document_attributes: [ :id, :image, :imageable_id, :imageable_type ])
	end

	def answer_params
		params.require(:answer).permit(:description, :user_id, :question_id)
	end
    
end
