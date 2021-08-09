module Api
  module V1
    class PlansController < ApplicationController

      def index
        @plans = Plan.all.includes(:user)
        render json: @plans.as_json(includes: [:user])
      end
      
      def create
        @plan = Plan.new(plan_params)
        if @plan.save
          render json: @plan
        else 
          render status: 400, json: {errors: {status: 400, error: @plan.errors.full_messages}}
        end
      end

      private

      def plan_params
        params.permit(:user_id, :title, :detail, :start_ymd, :start_time, :duration, :event_cls, :train_strength, :place, :prefecture, :join_limit)
      end

    end
  end    
end