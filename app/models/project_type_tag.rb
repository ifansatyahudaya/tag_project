class ProjectTypeTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :type_tag
end
