module Api
  module V1
    class InterestsController < ApplicationController
      before_action :set_user, only: [:destroy]

      def create
        interest = Interest.new(interest_params)
        if interest.save
          render json: interest
        else
          render status: 400, json: {errors: {status: 400, error: interest.errors.full_messages}}
        end
      end

      def destroy
        interest = @user.interests.find_by(plan_id: params[:plan_id])
        if interest.destroy
          render json: @user
        else
          render status: 400, json: {errors: {status: 400, error: interest.errors.full_messages}}
        end
      end

      private

      def set_user
        @user = User.find(params[:user_id])
      end

      def interest_params
        params.permit(:user_id, :plan_id)
      end
    end
  end
end
