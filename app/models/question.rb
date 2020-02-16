class Question < ApplicationRecord

	has_many :answers, dependent: :destroy

	def answered_by?(user)
		answers.where(user_id: user.id).exists?
	end

	def Question.search(search, model)
    if model == "2"
      Question.where(['title LIKE ?', "%#{search}%"])
    else
      Question.all
    end
end

end
