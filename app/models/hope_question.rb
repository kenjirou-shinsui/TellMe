class HopeQuestion < ApplicationRecord
	belongs_to :user
	has_many :agrees, dependent: :destroy

	def agreed_by?(user)
          agrees.where(user_id: user.id).exists?
    end
end
