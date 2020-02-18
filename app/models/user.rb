class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         acts_as_paranoid

         has_many :agrees, dependent: :destroy
         has_many :metoos, dependent: :destroy
         has_many :hope_questions, dependent: :destroy
         has_many :answers, dependent: :destroy

         has_many :relationships, dependent: :destroy
         has_many :followings, through: :relationships, source: :follow
         has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
         has_many :followers, through: :reverse_of_relationships, source: :user

         validates :first_name, presence: true,length: {maximum: 10}
         validates :last_name, presence: true, length: {maximum: 10}
         validates :kana_first_name, presence: true, format: { with: /\A[ぁ-んー－]+\z/, message: '全角ひらがなで入力して下さい。'},length: {maximum: 10}
         validates :kana_last_name, presence: true, format: { with: /\A[ぁ-んー－]+\z/, message: '全角ひらがなで入力して下さい。'},length: {maximum: 10}

         attachment :profile_image

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end

  def User.search(search, model)
    if model == "1"
      if search && search != ""
        words = search.to_s.split(" ")
        columns = ["first_name", "last_name", "kana_first_name", "kana_last_name"]
        query = []
            result = []

           columns.each do |column|
            query << ["#{column} LIKE ?"]
             end

             words.each_with_index do |w, index|
        if index == 0
          result[index] = User.where([query.join(" OR "), "%#{w}%","%#{w}%","%#{w}%","%#{w}%"])
        else
          result[index] = result[index-1].where([query.join(" OR "), "%#{w}%","%#{w}%","%#{w}%","%#{w}%"])
        end
      end
      return result[words.length-1]
    else
      User.all
    end
  end
   end
  end