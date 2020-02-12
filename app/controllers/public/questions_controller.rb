class Public::QuestionsController < ApplicationController

    def index
    	@all_questions = Question.all
    end
end
