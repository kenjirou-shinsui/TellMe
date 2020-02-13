class Admin::HopeQuestionsController < ApplicationController

	def index
		@hope_questions = HopeQuestion.all
    end

    def destroy
     hope_question = HopeQuestion.find(params[:id])
     hope_question.destroy
     redirect_to admin_hope_questions_path
    end
end
