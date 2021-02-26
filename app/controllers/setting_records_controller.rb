class SettingRecordsController < ApplicationController

  before_action :authenticate_user!

  def index
    @records = SettingRecord.find_by_user(current_user.id).page(params[:page])
  end
 
end
