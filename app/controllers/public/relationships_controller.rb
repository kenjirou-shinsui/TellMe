class Public::RelationshipsController < ApplicationController

	before_action :set_user,only: [:create,:destroy]

	def follow
        @relationships = Relationship.where(user_id:current_user.id)
    end

    def follower
        @relationships = Relationship.where(follow_id:current_user.id)
    end

  def create
    user = User.find(params[:follow_id])
    follow = current_user.follow(user)
    if follow.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    user = User.find(params[:follow_id])
    follow = current_user.unfollow(user)
    if follow.destroy
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def set_user
    user = User.find(params[:follow_id])
  end

end
