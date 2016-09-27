class TypeTag < ActiveRecord::Base
  validates :type_tag_name, presence: true

  has_many :tags
  has_many :detail_type_tags
end