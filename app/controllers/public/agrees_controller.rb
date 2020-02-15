class Public::AgreesController < ApplicationController

    before_action :authenticate_user!

    before_action :login_check

    def create
        hope_question = HopeQuestion.find(params[:hope_question_id])
        agree = current_user.agrees.new(hope_question_id: hope_question.id)
        agree.save
        redirect_back(fallback_location: root_path)
    end

    def destroy
        hope_question = HopeQuestion.find(params[:hope_question_id])
        agree = current_user.agrees.find_by(hope_question_id: hope_question.id)
        agree.destroy
        redirect_back(fallback_location: root_path)
    end

    private

    def login_check
        user = User.find(params[:user_id])
        unless  user.id == current_user.id
            redirect_to root_path
        end
    end

end