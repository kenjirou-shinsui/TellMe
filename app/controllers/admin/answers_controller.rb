class Admin::AnswersController < ApplicationController

	before_action :authenticate_admin!

	def index
		@question = Question.find(params[:question_id])
        @answers = @question.answers
	end

	def destroy
		answer = Answer.find(params[:id])
		answer.destroy
		redirect_to admin_user_path(answer.user_id)
	end

end
