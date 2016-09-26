class Tag < ActiveRecord::Base
  acts_as_taggable_on :tags

  has_many :project_type_tags
  has_many :type_tags, through: :project_type_tags
end
