class Admin::UsersController < ApplicationController

    before_action :authenticate_admin!

    def index
        @users = User.with_deleted.order("id DESC")
    end

    def show
        @user = User.with_deleted.find(params[:id])
        @all_answers = Answer.all
        @answers = @all_answers.where(user_id: @user.id)
    end

    def update
        @user = User.with_deleted.find(params[:id])
        @status = params[:status]
    if @status == "1"
      @user.restore
    else
      @user.destroy
    end
    redirect_to admin_user_path(@user.id)
    end

end
