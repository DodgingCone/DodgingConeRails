module CustomDevise
  class SessionsController < Devise::SessionsController
    prepend_before_filter :require_no_authentication, :only => [ :create ]
    include Devise::Controllers::Helpers

    respond_to :json

    # POST /resource
    def create
      self.resource = warden.authenticate!(auth_options)
      sign_in(resource_name, resource)

      # Reset the token manually
      resource.authentication_token = nil
      resource.save!

      render json: {
        auth_token: resource.authentication_token
      }
    end

    def destroy
      sign_out(resource_name)
    end
  end
end
