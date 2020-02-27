class Public::QuestionsController < ApplicationController

    def index
    	@all_questions = Question.page(params[:page]).per(10)
    	@metoos = Metoo.all
    end
end
