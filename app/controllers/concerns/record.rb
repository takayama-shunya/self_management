module Record
  extend ActiveSupport::Concern

  def show
    @commented = @record.comment
    @comment = Comment.new
    record_dates = RecordDate.find_record_date(@record.id)
    gon.record_value = record_dates.reverse.pluck(:content)
    gon.record_created_at = record_dates.reverse.map{ |r| r.created_at.strftime('%m/%d') }
  end

  def edit
    respond_to do |format|
      format.js { render :edit }
      format.html { render :edit }
    end
  end

  def destroy
    respond_to do |format|
      if @record.destroy
        format.js { flash.now[:success] = t('flash.destroyed') }
      else
        formato.html { redirect_to top_index_path, alert: t('alert.errors') }
      end
    end
  end
end


