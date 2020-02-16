class Admin::AgreesController < ApplicationController

	def show
		@hope_question = HopeQuestion.find(params[:hope_question_id])
		@agree = Agree.find(params[:id])
		@agrees = Agree.where(hope_question_id: @hope_question.id)
	end

end