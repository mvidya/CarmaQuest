class CommentsController < ApplicationController
	
	def new
		@commentable = Comment.new
	end

	def create
		@commentable = find_commentable
		params[:comment][:user_id] = current_user.id
		@comment = @commentable.comments.build(comment_params)
		if @comment.save
			flash[:notice] = "Successfully saved comment."
			redirect_to :id => nil
		else
			render :action => 'new'
		end
	end

	def index
		@commentable = find_commentable
		@comments = @commentable.comments
	end

	def find_commentable
		params.each do |name, value|
			if name =~ /(.+)_id$/
				return $1.classify.constantize.find(value)
			end
		end
		nil
	end

	private

	def comment_params
		params.require(:comment).permit(:comment_user, :user_id, :commentable_id, :commentable_type)
	end
end
