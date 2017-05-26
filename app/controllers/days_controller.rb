class DaysController < ApplicationController
  def new
    @day = Day.new
  end

  def create
    @day = Day.new(day_params)
    if @day.save
      redirect_to action: 'new', notice: "練習日追加しました。"
    else
      render action: 'new'
    end
  end

  private
    def day_params
      params.require(:day).permit(:p_date, :comment)
    end
end
