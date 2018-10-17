# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit

  def after_sign_in_path_for(resource)
    if resource.admin == true
      admin_path
    else
      leaves_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :password, :remember_me])
  end
end
