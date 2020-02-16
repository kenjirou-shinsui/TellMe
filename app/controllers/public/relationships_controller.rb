  class Public::RelationshipsController < ApplicationController

    before_action :authenticate_user!,only: [:create,:destroy]

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

  end
