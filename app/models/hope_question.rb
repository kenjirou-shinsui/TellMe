class HopeQuestion < ApplicationRecord
	belongs_to :user
	has_many :agrees, dependent: :destroy
end
