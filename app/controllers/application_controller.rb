class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  protected

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
