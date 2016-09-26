class DetailTypeTag < ActiveRecord::Base
  belongs_to :type_tag
  belongs_to :tag
end
