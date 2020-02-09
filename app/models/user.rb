class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :relationships, dependent: :destroy
         has_many :agrees, dependent: :destroy
         has_many :metoos, dependent: :destroy
         has_many :hope_questions, dependent: :destroy
         has_many :answers, dependent: :destroy
end
