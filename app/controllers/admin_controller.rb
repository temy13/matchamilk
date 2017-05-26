class AdminController < ApplicationController
  def new_part
    @part = Part.new
  end

  def create_part
    @part = Part.new(part_params)
    if @part.save
      redirect_to action: 'new_part', notice: "パート追加しました。"
    else
      render action: 'new_part'
    end
  end

  private
    def part_params
      params.require(:part).permit(:name, :specific)
    end
end
