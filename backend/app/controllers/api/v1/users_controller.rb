module Api
  module V1
    class UsersController < ApplicationController
      
      def show
        @user = User.includes(:plan).find(params[:id])
        render json: @user.as_json(include: [:plan])
      end

    end
  end    
end
