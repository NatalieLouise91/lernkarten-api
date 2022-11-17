class UsersController < ApplicationController
    before_action :authenticate_user, except: [ :create ]
    skip_before_action :authenticate_user, only: [:create]

    def index
        @users = User.all
        render json: @users, status: :ok
    end
    def show
        render json: @user, status: :ok
    end
    def create
        @user = User.new(user_params)
        @user.save
        if @user.errors.any?
            render json: { errors: @user.errors.full_messages }, 
            status: :unprocessable_entity
        else
            render json: @user, status: 201
        end
    end
    def update
        unless @user.update(user_params)
            render json: { errors: @user.errors.full_messages },
            status: :unprocessable_entity
        end
    end

    def destroy
        @user.destroy
    end

    private

    def find_user
        @user = User.find_by_username!(params[:_username])
        rescue ActiveRecord::RecordNotFound
            render json: { errors: 'User not found' }, status: :not_found
    end

    def user_params
        params.permit(:username, :email, :password, :password_confirmation)
    end
end
