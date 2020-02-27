class Public::MetoosController < ApplicationController

    before_action :authenticate_user!,only: [:create,:destroy]

    def index
        @metoos = Metoo.where(user_id: current_user.id).page(params[:page]).per(10).reverse_order
    end

    def show
        @metoo = Metoo.find(params[:id])
        @answer =Answer.find(params[:answer_id])
        @metoos = Metoo.where(answer_id: @answer.id).page(params[:page]).per(10).reverse_order
    end

    def create
        answer = Answer.find(params[:answer_id])
        metoo = current_user.metoos.new(answer_id: answer.id)
        metoo.save
        redirect_back(fallback_location: root_path)
    end

    def destroy
        answer = Answer.find(params[:answer_id])
        metoo = current_user.metoos.find_by(answer_id: answer.id)
        metoo.destroy
        redirect_back(fallback_location: root_path)
    end

end
