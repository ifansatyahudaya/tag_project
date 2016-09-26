class TypeTag < ActiveRecord::Base
  # has_many :project_type_tags, dependent: :destroy
  has_many :detail_type_tags, dependent: :destroy
  has_many :tag_data_types
  has_many :tags, through: :tag_data_types
end
