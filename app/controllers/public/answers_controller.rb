class Public::AnswersController < ApplicationController

	def new
        @question = Question.find(params[:question_id])
        @answer = Answer.new
    end

    def edit
        @question = Question.find(params[:question_id])
        @answer = Answer.find(params[:id])
    end

    def create
     @question = Question.find(params[:question_id])
     @answer = current_user.answers.new(answer_params)
     @answer.question_id = @question.id
     @answer.save
     redirect_to public_questions_path
    end

    def update
        @question = Question.find(params[:question_id])
        @answer = Answer.find(params[:id])
      if @answer.update(answer_params)
         redirect_to public_questions_path
      else
         render :edit
      end
    end

    def destroy
    question = Question.find(params[:question_id])
    answer = current_user.answers.find_by(question:question.id)
    answer.delete
    redirect_to public_questions_path
    end

private

 def answer_params
    params.require(:answer).permit(:question_id,:user_id,:body)
 end

end
