@answers = Answer.where(user_id: current_user.id)
    	@answer = @answers.where(question_id: question.id)