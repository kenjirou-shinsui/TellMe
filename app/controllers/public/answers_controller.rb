class Public::AnswersController < ApplicationController

	def new
        @question = Question.find_by(params[:question_id])
        @answer = Answer.new
    end

    def edit
    end

    def create
     @question = Question.find(params[:question_id])
     @answer = current_user.answers.new(answer_params)
     @answer.question_id = @question.id
     @answer.save
     redirect_to public_questions_path
    end

    def update
    end

    def destroy
    end

private

 def answer_params
    params.require(:answer).permit(:question_id,:user_id,:body)
 end

end
