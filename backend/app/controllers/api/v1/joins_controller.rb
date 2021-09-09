module Api
  module V1
    class JoinsController < ApplicationController
      before_action :set_user, only: [:create]

      def create
        if @plan.join_limit > @join.count
          join = Join.new(join_params)
          if join.save
            render json: join
          else
            render status: :bad_request, json: {errors: {status: 400, error: join.errors.full_messages}}
          end
        else
          render status: :bad_request, json: {errors: {status: 400, error: ["参加上限に達しています。"]}}
        end
      end

      def destroy
        join = Join.find(params[:id])
        if join.destroy
          render json: join
        else
          render status: :bad_request, json: {errors: {status: 400, error: join.errors.full_messages}}
        end
      end

      private

      def set_user
        @plan = Plan.find(params[:plan_id])
        @join = Join.where(plan_id: params[:plan_id])
      end

      def join_params
        params.permit(:user_id, :plan_id)
      end

    end
  end
end
