module Api
  module V1
    class UsersController < ApplicationController
      
      def show
        @user = User.select('id, name, profile, birth_year, birth_month, birth_day, icon, sex')
                    .includes({plan: [:user, :joins ]}, 
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
              only: %w[id name profile icon],
              include: [{
                followers: {
                  only: %w[id]
                },
              }]
            },
            followers: {
              only: %w[id name profile icon],
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
