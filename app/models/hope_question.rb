class HopeQuestion < ApplicationRecord

	belongs_to :user
	has_many :agrees, dependent: :destroy

	validates :hope_body, presence: true,length: {maximum: 50}

	def agreed_by?(user)
		agrees.where(user_id: user.id).exists?
	end
end
