class CommentsController < ApplicationController

  before_action :set_comment, only: %i[ edit update destroy ]

  def create
    @record = SettingRecord.find(set_record_type)
    @comment = @record.build_comment(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to setting_records_path, notice: "sucess" }
      else
        format.html { redirect_to top_index_path, alert: "errors" }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @comment.destroy
  end

  private

  def set_record_type
    @record_type_name = request.referer.split('/')[4]
    if @record_type_name == "integer_records"
      params[:integer_record_id]
    elsif @record_type_name == "decimal_records"
      params[:decimal_record_id]
    elsif @record_type_name == "time_records"
      params[:time_record_id]
    elsif @record_type_name == "count_records"
      params[:count_record_id]
    elsif @record_type_name == "check_records"
      params[:check_record_id]
    end
  end


  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:commentable_type, :commentable_id, :content)
  end

end
