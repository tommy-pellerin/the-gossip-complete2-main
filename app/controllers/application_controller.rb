class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception # Prevent CSRF attacks by raising an exception.
  include SessionsHelper
end
