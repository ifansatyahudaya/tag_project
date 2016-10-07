# == Schema Information
#
# Table name: tags
#
#  id             :integer          not null, primary key
#  name           :string
#  taggings_count :integer          default(0)
#  type_tag_id    :integer
#
# Indexes
#
#  index_tags_on_name  (name) UNIQUE
#

class Tag < ActiveRecord::Base
  acts_as_taggable_on :tags

  belongs_to :type_tag

  scope :have_tag_type, -> { where.not(type_tag_id: nil) }
  scope :have_no_tag_type, -> { where(type_tag_id: nil) }

  def has_tag_type?
    self.type_tag_id.present?
  end
end
