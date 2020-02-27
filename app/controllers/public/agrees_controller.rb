class Public::AgreesController < ApplicationController

    before_action :authenticate_user!

    def create
        @hope_question = HopeQuestion.find(params[:hope_question_id])
        @agree = Agree.create(user_id: current_user.id, hope_question_id: @hope_question.id)
        @agree.save
    end

    def destroy
        @hope_question = HopeQuestion.find(params[:hope_question_id])
        @agree = current_user.agrees.find_by(hope_question_id: @hope_question.id)
        @agree.destroy
    end


end