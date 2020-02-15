class Public::HopeQuestionsController < ApplicationController

    before_action :authenticate_user!,only: [:new,:create,:destroy]
    before_action :login_check,only: [:new,:create,:destroy]


    def new
        @hope_question = HopeQuestion.new
    end

    def index
        @hope_questions = HopeQuestion.all.order("id DESC")
    end

    def thanks
    end

    def create
        @hope_question = HopeQuestion.new(hope_question_params)
        @hope_question.user_id = current_user.id
        if  @hope_question.save
            redirect_to thanks_public_hope_question_path, notice: "successfully created question!"
        else
            render :new
        end
    end

    def destroy
        @hope_question = HopeQuestion.find(params[:id])
        @hope_question.destroy
        redirect_to public_hope_questions_path
    end

    private

    def hope_question_params
        params.require(:hope_question).permit(:hope_body,:user_id)
    end

    def login_check
        user = User.find(params[:user_id])
        unless  user.id == current_user.id
            redirect_to root_path
        end
    end

end
