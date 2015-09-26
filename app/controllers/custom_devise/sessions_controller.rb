module CustomDevise
  class SessionsController < Devise::SessionsController
    prepend_before_filter :require_no_authentication, :only => [ :create ]
    include Devise::Controllers::Helpers

    respond_to :json

    # POST /resource
    def create
      resource = Player.find_for_database_authentication(:email => params[:player][:email])

      return invalid_login_attempt unless resource

      if resource.valid_password?(params[:player][:password])
        sign_in(resource_name, resource)

        # Reset the token manually
        resource.authentication_token = nil
        resource.save!

        render json: {
          auth_token: resource.authentication_token
        }
      else
        invalid_login_attempt
      end
    end

    def destroy
      sign_out(resource_name)
    end

    protected

      def invalid_login_attempt
        warden.custom_failure!
        render json: {
          errors: ["Invalid login"]
        }, status: :unauthorized
      end
  end
end
