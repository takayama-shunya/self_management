class SettingRecordsController < ApplicationController

  def index
    @records = SettingRecord.where(user_id: current_user.id)
  end
  
end
