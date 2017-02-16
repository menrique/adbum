class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # General exception manager
  rescue_from Exception do |e|
    flash[:error] = e.message
    redirect_to root_path
  end

end
