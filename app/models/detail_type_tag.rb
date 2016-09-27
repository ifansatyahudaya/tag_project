class DetailTypeTag < ActiveRecord::Base
  belongs_to :type_tag

  with_options presence: true do |c|
    c.validates :type_tag
    c.validates :type_tag_value
  end
end
