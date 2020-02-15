class Public::QuestionsController < ApplicationController

    def index
    	@all_questions = Question.all.order("id DESC")
    	@metoos = Metoo.all
    end
end
