# == Schema Information
#
# Table name: members
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  part_id    :integer
#  comment    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Member < ActiveRecord::Base
  belongs_to :part
  has_many :entry

  after_create :create_entries

  def create_entries
    @days = Day.all
    @days.each do |day|
      Entry.create(member_id: self.id, day_id: day.id, status: :undefined)
    end
  end

end
