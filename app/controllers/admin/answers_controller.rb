class Admin::AnswersController < ApplicationController

 def destroy
 	answer = Answer.find(params[:id])
    answer.destroy
    redirect_to admin_user_path(answer.user_id)
 end

end
