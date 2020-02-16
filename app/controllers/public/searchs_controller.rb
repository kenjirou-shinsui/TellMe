class Public::SearchsController < ApplicationController

	def index
        @model = params[:model]
    if @model == "1"
      @users = User.search(params[:search], @model)
    elsif
      @questions = Question.search(params[:search], @model)
  else
  	@hope_questions = HopeQuestion.search(params[:search], @model)
    end
    end
end
