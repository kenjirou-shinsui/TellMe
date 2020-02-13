class Answer < ApplicationRecord
	belongs_to :user
	belongs_to :question
	has_many :metoos, dependent: :destroy

	def me_tooed_by?(user)
          metoos.where(user_id: user.id).exists?
    end

end
