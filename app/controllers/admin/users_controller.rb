class Admin::UsersController < ApplicationController

    before_action :authenticate_admin!

	def index
      @users = User.all.order("id DESC")
    end

    def show
    	@user = User.find(params[:id])
    	@all_answers = Answer.all
        @answers = @all_answers.where(user_id: @user.id)
    end

    def update
    end

end
