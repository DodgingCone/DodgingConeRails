class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # Protect_from_forgery with: :exception.
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| 
        u.permit(:username, :email, :password, :password_confirmation, :remember_me) 
      }
      devise_parameter_sanitizer.for(:sign_in) { |u| 
        u.permit(:login, :username, :email, :password, :remember_me) 
      }
      devise_parameter_sanitizer.for(:account_update) { |u| 
        u.permit(:username, :email, :password, :password_confirmation, :current_password) 
      }
    end

    def remember_location
      session[:back_paths] ||= []
      unless session[:back_paths].last == request.fullpath
        session[:back_paths] << request.fullpath
      end

      # Make sure that the array doesn't bloat too much
      session[:back_paths] = session[:back_paths][0..2]
    end

    def previous_page
      session[:back_paths] ||= []
      session[:back_paths].pop
    end

    def after_sign_in_path_for(resource)
      back = previous_page

      if back != nil
        back
      else
        scores_path
      end
    end

    def after_sign_out_path_for(resource_or_scope)
      root_path
    end
end
