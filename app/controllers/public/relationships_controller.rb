  class Public::RelationshipsController < ApplicationController

    before_action :authenticate_user!,only: [:follow,:follower,:create,:destroy]
    before_action :login_check,only: [:follow,:follower,:create,:destroy]

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

    def login_check
      user = User.find(params[:user_id])
      unless  user.id == current_user.id
        redirect_to root_path
      end
    end

  end
