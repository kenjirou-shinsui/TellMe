class Admin::HopeQuestionsController < ApplicationController

	def index
		@hope_questions = HopeQuestion.all
    end
end
