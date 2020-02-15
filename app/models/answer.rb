class Answer < ApplicationRecord

	belongs_to :user
	belongs_to :question
	has_many :metoos, dependent: :destroy

	validates :body, presence: true,length: {maximum: 50}


	def me_tooed_by?(user)
		metoos.where(user_id: user.id).exists?
	end

end
