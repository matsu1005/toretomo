module Api
  module V1
    class UsersController < ApplicationController
      
      def show
        @user = User.includes({plan: [:user, :joins ]}, 
                              {planjoin: [:join_users, :user ]}, 
                              {followings: [:followings]}, 
                              {followers: [:followings]}).find(params[:id])
        render json: @user.as_json(include: [{
            plan: {
              include: [{
                user: {
                  only: %w[id name icon]
                },
                joins: {
                  only: %w[id user_id]
                },
              }]
            }, 
            planjoin: {
              include: [{
                joins: {
                  only: %w[id user_id]
                },
                user: {
                  only: %w[id name icon]
                }
              }]
            },
            followings: {
              include: [{
                followers: {
                  only: %w[id]
                },
              }]
            },
            followers: {
              include: [{
                followers: {
                  only: %w[id]
                },
              }]
            },
          }
          ])
      end

    end
  end    
end
