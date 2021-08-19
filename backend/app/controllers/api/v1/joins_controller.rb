module Api
  module V1
    class JoinsController < ApplicationController

      def create
        join = Join.new(join_params)
        if join.save
          render json: join
        else
          render status: 400, json: {errors: {status: 400, error: join.errors.full_messages}}
        end
      end

      def destroy
        join = Join.find(params[:id])
        if join.destroy
          render json: @user
        else
          render status: 400, json: {errors: {status: 400, error: join.errors.full_messages}}
        end
      end

      private

      def join_params
        params.permit(:user_id, :plan_id)
      end

    end
  end
end
