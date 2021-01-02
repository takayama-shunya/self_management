class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :today_condition, :week_day

  def after_sign_in_path_for(resource)
    '/top'
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:email, :name, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

  private

  def today_condition
    @date = Time.now
    @condition = current_user.conditions.find_by(created_at: @date.all_day)
  end

  def week_day
    @week_day = %w(月 火 水 木 金 土 日)
  end

end
