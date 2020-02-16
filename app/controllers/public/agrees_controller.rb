class Public::AgreesController < ApplicationController

    before_action :authenticate_user!

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


end