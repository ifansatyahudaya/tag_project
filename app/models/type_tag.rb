# == Schema Information
#
# Table name: type_tags
#
#  id            :integer          not null, primary key
#  type_tag_name :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class TypeTag < ActiveRecord::Base
  validates :type_tag_name, presence: true

  has_many :tags
  has_many :detail_type_tags
end
