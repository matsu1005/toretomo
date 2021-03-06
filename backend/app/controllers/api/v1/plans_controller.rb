module Api
  module V1
    class PlansController < ApplicationController

      def index
        @plans = Plan.all.includes(:user, :joins, :interests).order(created_at: :desc)
        render json: @plans.as_json(include: [
            { 
              user: {
                only: %w[icon name] 
                }
            }, 
            :joins, 
            {
              interests: {
                only: [:user_id]
                }
            }
          ])
      end

      def show 
        @plan = Plan.includes(:user, {joins: [:user]}, :interests).find(params[:id])
        render json: @plan.as_json(include: [{
            user: {
              only: %w[icon name] 
              },
            joins: {
              only: %w[id user_id],
              include: [{
                user: {
                  only: %w[id name icon]
                }
              }]
            },
            interests: {

            }
          }]
        )
      end
      
      def create
        @plan = Plan.new(plan_params)
        if @plan.save
          render json: @plan
        else 
          render status: :bad_request, json: {errors: {status: 400, error: @plan.errors.full_messages}}
        end
      end

      def update
        @plan = Plan.find(params[:id])
        @join = Join.where(plan_id: params[:id])
        if @join.count <= params[:join_limit].to_i
          if @plan.update(plan_params)
            render json: @post
          else
            render status: :bad_request, json: {errors: {status: 400, error: @plan.errors.full_messages}}
          end
        else
          render status: :bad_request, json: {errors: {status: 400, error: ["すでに参加者がいるため、参加人数を減らせません。"]}}
        end
      end

      def destroy
        plan = Plan.find(params[:id])
        if plan.destroy
          render json: plan
        else
          render status: :bad_request, json: {errors: {status: 400, error: @plan.errors.full_messages}}
        end
      end

      def search
        if params[:event] && params[:prec]
          @plans = Plan.where(prefecture: params[:prec]).where(event_cls: params[:event])
                              .all.includes(:user, :joins, :interests).order(created_at: :desc)          
        elsif params[:event] || params[:prec]
          @plans = Plan.where(prefecture: params[:prec]).or(Plan.where(event_cls: params[:event]))
                              .all.includes(:user, :joins, :interests).order(created_at: :desc)
        else
          @plans = Plan.all.includes(:user, :joins, :interests).order(created_at: :desc)
        end        
        render json: @plans.as_json(include: [
          { 
            user: {
              only: %w[icon name] 
              }
          }, 
          :joins, 
          {
            interests: {
              only: [:user_id]
              }
          }
        ])
      end

      private

      def plan_params
        params.permit(:user_id, :title, :detail, :start_ymd, :start_time, :duration, :event_cls, :train_strength, :place, :prefecture, :join_limit)
      end

    end
  end    
end