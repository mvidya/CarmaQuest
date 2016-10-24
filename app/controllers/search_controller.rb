class SearchController < ApplicationController

    def search_index
		@answers = Answer.where('description LIKE ?', '%' + "%#{params[:q]}%" + '%')
		@questions = Question.where("title LIKE ? OR description LIKE ?", '%' + "%#{params[:q]}%" + '%', '%' + "%#{params[:q]}%" + '%')
    end
end