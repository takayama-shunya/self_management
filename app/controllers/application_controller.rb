class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :today_condition, :week_day, :current_user_records
  include ApplicationHelper

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

  def week_day
    @week_day = %w(日 月 火 水 木 金 土 日)
  end

  def today_condition
    @date = Time.now.strftime('%Y-%m-%d')
    @condition = current_user.conditions.find_condition(@date)
    # @condition = current_user.conditions.find_by(created_at: @date.in_time_zone.all_day)
  end

end
