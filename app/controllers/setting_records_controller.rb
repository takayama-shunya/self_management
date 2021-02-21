class SettingRecordsController < ApplicationController

  before_action :authenticate_user!

  def index
    @records = SettingRecord.where(user_id: current_user.id).page(params[:page])
  end
 
end
