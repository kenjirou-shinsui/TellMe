class Question < ApplicationRecord

	has_many :answers, dependent: :destroy

	def answered_by?(user)
		answers.where(user_id: user.id).exists?
	end

	def Question.search(search, model)
    if model == "2"
    	if search && search != ""
    		words = search.to_s.split(" ")
    		columns = ["title"]
    		query = []
            result = []

           columns.each do |column|
            query << ["#{column} LIKE ?"]
             end

             words.each_with_index do |w, index|
        if index == 0
          result[index] = Question.where([query.join(" OR "), "%#{w}%"])
        else
          result[index] = result[index-1].where([query.join(" OR "), "%#{w}%"])
        end
      end
      return result[words.length-1]
    else
      Question.all
    end
  end
   end
  end