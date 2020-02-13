class Public::QuestionsController < ApplicationController

    def index
    	@all_questions = Question.all
    	@metoos = Metoo.all
    end
end
