class TypeTag < ActiveRecord::Base
  has_many :detail_type_tags, dependent: :destroy
  # has_many :project_type_tags, dependent: :destroy
  has_many :project_type_tags
  has_many :tags, through: :project_type_tags
end
