class Project < ActiveRecord::Base
  acts_as_taggable_on :tags
  # attr_accessible :name, :description, :tag_list
end
