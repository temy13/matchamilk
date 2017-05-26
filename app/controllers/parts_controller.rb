class PartsController < ApplicationController
  def show
    #update_entry unless params[:ajax_handler].blank?
    @part = Part.find_by(specific: params[:id])
    @members = Member.where(part_id: @part.id)
    @member = Member.new
    @days = Day.all
    @h_entries = Hash[*@days.map{|e| [e.id, {}]}.flatten]
    @days.each {|day|
      Entry.statuses.each{ |status|
        # logger.debug status
        @h_entries[day.id][status[0].to_sym] = Entry.where(day_id: day.id, status_cd: status[1]).map{ |e|
           Member.find(e.member_id).name
        }
      }
    }

    if params[:member_id]
      @selected_member = Member.find(params[:member_id])
      Entry.where(:member_id => @selected_member.id).each { |e|
        @h_entries[e.day_id][:status] = e.status
      }
      # @h_entries = Hash[*Entry.where(:member_id => @selected_member.id).map{|e| [e.day_id, e.status]}.flatten]
    end
  end

  def update_entry
    @entry = Entry.where(member_id: params[:member_id], day_id: params[:day_id]).first
    @entry.status = params[:status]
    #@entry.status_cd = Entry.statuses[params[:status].to_sym]
    if @entry.save
      render
    else
      #TODO ERROR
      render json: 'no data'
    end
  end

  def member_select
    redirect_to controller: 'parts', action: 'show', id: params[:id],  member_id: params[:m][:m_id]
  end



end
