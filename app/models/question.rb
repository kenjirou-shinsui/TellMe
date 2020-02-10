class Question < ApplicationRecord
	has_many :answers, dependent: :destroy

	def answered_by?(user)
          answers.where(user_id: user.id).exists?
    end
end
