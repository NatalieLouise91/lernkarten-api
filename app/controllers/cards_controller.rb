class CardsController < ApplicationController
    before_action :set_card, only: [:show, :edit, :update, :destroy]
    def index
        @cards = Card.order(id: :asc)
        render json: @cards
    end

    def show
        render json: @card
    end

    def new
        @card = Card.new
    end 

    def edit
    end

    def create
        @card = Card.new(card_params)
        @card.save

        if @card.errors.any?
            render json: @card.errors, status: :unprocessable_entity
        else
            render json: @card, status: 201
        end
    end

    def update
        @card.word = params['word']
        @card.definition = params['definition']
        @card.gender = params['gender']
        @card.sentence = params['sentence']
        @card.save
        if @card.errors.any?
            render json: @card.errors.full_messages, status: :unprocessable_entity
        else
            render json: @card, status: 201
        end
    end

    def destroy
        @card.destroy
        if @card.errors.any?
            render json: @card.errors.full_messages, status: :unprocessable_entity
        else
            render json: @card, status: 201
        end
    end

    private
    def set_card
        @card = Card.find(params[:id])
    end
    def card_params
        params.permit(:word, :definition, :gender, :sentence, :user_id)
    end
end
