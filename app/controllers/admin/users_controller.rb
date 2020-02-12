class Admin::UsersController < ApplicationController

	def index
      @users = User.all
    end

    def show
    	@user = User.find(params[:id])
    	@all_answers = Answer.all
        @answers = @all_answers.where(user_id: @user.id)
    end

    def update
    end

end
