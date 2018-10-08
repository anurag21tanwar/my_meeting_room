class ApplicationController < ActionController::Base

  before_action :authenticate_employee!

  private

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_employee_session_path
  end
end
