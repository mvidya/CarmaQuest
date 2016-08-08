class SearchController < ApplicationController  

    def index
            q = params[:q]
            # debugger
            @questions = Question.search(description_cont: q).result
            @answers = Answer.search(description_cont: q).result
            @seminars = Seminar.search(title_cont: q).result
    end
   
end 