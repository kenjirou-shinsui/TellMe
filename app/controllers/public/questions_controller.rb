class Public::QuestionsController < ApplicationController

    def index
    	@all_questions = Question.page(params[:page]).reverse_order
    	@metoos = Metoo.all
    end
end
