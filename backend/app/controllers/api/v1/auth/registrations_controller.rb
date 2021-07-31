module Api
  module V1
    module Auth
      class RegistrationsController < DeviseTokenAuth::RegistrationsController
        private
      
        def sign_up_params
          params.permit(:name, :email, :password, :password_confirmation)
        end
      
        def accout_update_params
          params.permit(:name, :email, :icon, :profile, :birth_year, :birth_month, :birth_day, :sex)
        end

      end
    end
  end
end
