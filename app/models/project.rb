class Project < ActiveRecord::Base
  acts_as_taggable_on :tags
  # attr_accessible :name, :description, :tag_list
  belongs_to :company
  belongs_to :user

  scope :by_company_id, -> (id) { where(company_id: id) }
end
