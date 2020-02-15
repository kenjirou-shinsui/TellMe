class Admin::HopeQuestionsController < ApplicationController

	before_action :authenticate_admin!

	def index
		@hope_questions = HopeQuestion.all.order("id DESC")
    end

    def destroy
     hope_question = HopeQuestion.find(params[:id])
     hope_question.destroy
     redirect_to admin_hope_questions_path
    end
end
