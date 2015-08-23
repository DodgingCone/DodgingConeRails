class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  protected

  def after_sign_in_path_for(resource)
    scores_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
