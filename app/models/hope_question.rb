class HopeQuestion < ApplicationRecord

	belongs_to :user
	has_many :agrees, dependent: :destroy

	validates :hope_body, presence: true,length: {maximum: 50}

	def agreed_by?(user)
		agrees.where(user_id: user.id).exists?
	end

	def HopeQuestion.search(search, model)
    if model == "3"
    	if search && search != ""
    		words = search.to_s.split(" ")
    		columns = ["hope_body"]
    		query = []
            result = []

           columns.each do |column|
            query << ["#{column} LIKE ?"]
             end

             words.each_with_index do |w, index|
        if index == 0
          result[index] = HopeQuestion.where([query.join(" OR "), "%#{w}%"])
        else
          result[index] = result[index-1].where([query.join(" OR "), "%#{w}%"])
        end
      end
      return result[words.length-1]
    else
      HopeQuestion.all
    end
  end
   end
  end