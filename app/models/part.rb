# == Schema Information
#
# Table name: parts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  specific   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Part < ActiveRecord::Base
  has_many :member

  validates_presence_of :specific
  validates_uniqueness_of :specific, case_sensitive: false

  def to_param
    specific
  end
end
