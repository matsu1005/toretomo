module Api
  module V1
    class UsersController < ApplicationController
      
      def show
        @user = User.includes({plan: :user}).find(params[:id])
        render json: @user.as_json(include: [{plan: {include: {user: {only: %w[id name icon]}}}}])
      end

    end
  end    
end
