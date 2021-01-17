class CommentsController < ApplicationController

  before_action :set_comment, only: %i[ edit update destroy ]

  def create
    what_instansce_to_build
    respond_to do |format|
      if @comment.save
        format.js { flash.now[:success] = "created" }
      else
        format.js 
      end
    end
  end

  def edit
    respond_to do |format|
      format.js { render :edit }
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.js { flash.now[:success] = "updated" }
      else
        format.js 
      end
    end
  end

  def destroy
    comment_destroy_set
    respond_to do |format|
      if @comment.destroy
        @comment = Comment.new
        format.js { flash.now[:success] = "deleted" }
      else
        format.html { redirect_to top_index_path, alert: "errors" }
      end
    end
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
    elsif @record_type_name == "conditions"
      params[:condition_id]
    end
  end

  def what_instansce_to_build
    set_record_type
    if params[:condition_id]
      @condition = Condition.find(set_record_type)
      @comment = @condition.build_comment(comment_params)
    else
      @record = SettingRecord.find(set_record_type)
      @comment = @record.build_comment(comment_params)
    end
  end


  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:commentable_type, :commentable_id, :content)
  end

  def comment_destroy_set
    @commentable_type = @comment.commentable_type
    if @commentable_type == "Condition"
      @record = Condition.find(@comment.commentable_id)
    else
      @record = SettingRecord.find(@comment.commentable_id)
    end 
  end


end
