# == Schema Information
#
# Table name: days
#
#  id         :integer          not null, primary key
#  p_date     :datetime
#  comment    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Day < ActiveRecord::Base
  has_many :entry

  after_create :create_entries

  def create_entries
    @members = Member.all
    @members.each do |member|
      Entry.create(member_id: member.id, day_id: self.id, status: :undefined)
    end
  end

end
