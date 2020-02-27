class Admin::SearchsController < ApplicationController

	before_action :authenticate_admin!

	def index
        @model = params[:model]
    if @model == "1"
      @users = User.search(params[:search], @model).page(params[:page]).per(10).reverse_order
    elsif @model == "2"
      @questions = Question.search(params[:search], @model).page(params[:page]).per(10).reverse_order
  else @model == "3"
  	@hope_questions = HopeQuestion.search(params[:search], @model).page(params[:page]).per(10).reverse_order
    end
    end
end
