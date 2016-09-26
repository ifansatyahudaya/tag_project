class Tag < ActiveRecord::Base
  acts_as_taggable_on :tags

  has_many :tag_data_types
  has_many :type_tags, through: :tag_data_types
end
