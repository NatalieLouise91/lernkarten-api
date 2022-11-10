class CardsController < ApplicationController
    def index
        @cards = Card.order(id: :asc)
        render json: @cards
    end

    def show
        @card = Card.find(params[:id])
        render json: @card
    end

    def new
        @card = Card.new
    end 

    def create
        @card = Card.create(card_params)
        @card.save

        if @card.errors.any?
            render json: @card.errors, status: :unprocessable_entity
        else
            render json: @card, status: 201
        end
    end

    def update
        @card = Card.find_by_id(params[:id])
    end

    def destroy
        @card = Card.find_by_id(params[:id])
        if @card
            @card.destroy
            render json: @card, status: 201
        end
    end

    private
    def card_params
        params.require(:card).permit(:word, :definition, :gender, :sentence)
    end
end
