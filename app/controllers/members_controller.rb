class MembersController < ApplicationController
  def create
    @member = Member.new(member_params)
    part = Part.find(@member.part_id)
    if @member.save
      redirect_to controller: 'parts', action: 'show', id: part.specific,  member_id: @member.id, notice: "メンバー追加しました。"
    else
      render controller: 'parts', action: 'show', id: part.specific
    end
  end

  private
    def member_params
      params.require(:member).permit(:name, :part_id, :comment)
    end
end
