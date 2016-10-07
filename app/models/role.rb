# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Role < ActiveRecord::Base
  IDS = { SUPER_ADMIN: 10, ADMIN: 11, USER: 12 }
  has_many :users, dependent: :destroy
end
