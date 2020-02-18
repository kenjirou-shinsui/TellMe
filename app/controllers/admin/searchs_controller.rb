class Admin::SearchsController < ApplicationController

	before_action :authenticate_admin!

	def index
    @all_questions = Question.all.order("id DESC")
    @answers = Answer.all
        @model = params[:model]
    if @model == "1"
      @users = User.search(params[:search], @model)
    elsif @model == "2"
      @questions = Question.search(params[:search], @model)
  else @model == "3"
  	@hope_questions = HopeQuestion.search(params[:search], @model)
    end
    end
end
