class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def nice_error(errors, title = '')
    error_msg = "<strong>#{title}</strong>"
    error_msg += errors.inject('<ul>') { |memo, value| memo + "<li>#{value}</li>" } + '</ul>'
    error_msg.html_safe
  end
end
