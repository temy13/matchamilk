# == Schema Information
#
# Table name: entries
#
#  id         :integer          not null, primary key
#  member_id  :integer
#  day_id     :integer
#  status_cd  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Entry < ActiveRecord::Base
  belongs_to :member
  belongs_to :day

  as_enum :status, [:undefined, :participate, :late, :absence]


end
