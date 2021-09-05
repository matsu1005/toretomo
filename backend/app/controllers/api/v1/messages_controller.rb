module Api
  module V1
    class MessagesController < ApplicationController

      def show
        @messages = Message.all.includes(:user).where(plan_id: params[:plan_id])
        render json: @messages.as_json(
          include: [{
            user: {
               only: %w[id name icon] 
              }
            }]
          )
      end

      def create
        @message = Message.new(message_params)
        if @message.save
          render json: @message 
        else 
          render status: 400, json: {errors: {status: 400, error: @message.errors.full_messages}}
        end
      end

      def destroy
        message = Message.find(params[:id])
        if message.destroy
          render json: message
        else
          render status: 400, json: {errors: {status: 400, error: message.errors.full_messages}}
        end
      end

      private

      def message_params
        params.permit(:plan_id, :user_id, :content, :image)
      end

    end
  end
end
