class Public::UsersController < ApplicationController

    before_action :authenticate_user!,only: [:follow,:follower,:edit,:withdraw,:update,:destroy]
    before_action :login_check,only: [:edit,:withdraw,:update,:destroy]

    def index
        @users = User.page(params[:page]).reverse_order
    end

    def show
        @user = User.find(params[:id])
        @all_answers = Answer.all.page(params[:page]).order('question_id')
        @answers = @all_answers.where(user_id: @user.id)
    end

    def edit
        @user = User.find(params[:id])
    end

    def withdraw
        @user = User.find(params[:id])
    end

    def follow
      @relationships = Relationship.where(user_id:current_user.id).page(params[:page]).reverse_order
    end

    def follower
      @relationships = Relationship.where(follow_id:current_user.id).page(params[:page]).reverse_order
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to public_user_path(@user.id)
        else
            render :edit
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:first_name,:last_name,:kana_first_name,:kana_last_name,:email,:profile_image)
    end

    def login_check
        user = User.find(params[:id])
        unless  user.id == current_user.id
            redirect_to root_path
        end
    end

end
