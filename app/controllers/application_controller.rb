# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Authentication

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      added_attrs = %i[email]
      devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
      devise_parameter_sanitizer.permit(:sign_in, keys: added_attrs)
    end
end
