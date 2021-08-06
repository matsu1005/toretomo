module Api
  module V1
    class PlansController < ApplicationController

      def index
        @plan = Plan.all.includes(:user)
        render json: @plan.as_json(includes: [:user])
      end
      
    end
  end    
end