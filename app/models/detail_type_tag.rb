# == Schema Information
#
# Table name: detail_type_tags
#
#  id             :integer          not null, primary key
#  type_tag_id    :integer          not null
#  type_tag_value :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class DetailTypeTag < ActiveRecord::Base
  belongs_to :type_tag

  with_options presence: true do |c|
    c.validates :type_tag
    c.validates :type_tag_value
  end
end
