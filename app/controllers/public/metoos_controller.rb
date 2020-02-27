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
        @answer = Answer.find(params[:answer_id])
        @metoo = Metoo.create(user_id: current_user.id, answer_id: @answer.id)
        @metoo.save
    end

    def destroy
        @answer = Answer.find(params[:answer_id])
        @metoo = Metoo.find_by(user_id: current_user.id, answer_id: @answer.id)
        @metoo.destroy
    end

end
