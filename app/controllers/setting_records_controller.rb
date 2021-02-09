class SettingRecordsController < ApplicationController

  before_action :authenticate_user!

  def index
    current_user_records
  end
 
end
