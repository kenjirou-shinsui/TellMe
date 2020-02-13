class Public::UsersController < ApplicationController

	def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
        @all_answers = Answer.all
        @answers = @all_answers.where(user_id: @user.id)
    end

    def edit
        @user = User.find(params[:id])
    end

    def withdraw
        @user = User.find(params[:id])
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
    end

private

 def user_params
    params.require(:user).permit(:first_name,:last_name,:kana_first_name,:kana_last_name,:email,:profile_image)
 end

end
