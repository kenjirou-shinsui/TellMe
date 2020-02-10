class Public::QuestionsController < ApplicationController

    def index
    	@questions = Question.all
    	@question = Question.find_by(params[:question_id])
    	@answer = @question.answers.where(user_id: current_user.id)
    end
end
