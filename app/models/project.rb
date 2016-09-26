class Project < ActiveRecord::Base
  acts_as_taggable_on :tags

  validates :name, :company, :user, presence: true

  belongs_to :company
  belongs_to :user

  has_many :project_users
  has_many :users, through: :project_users
  # has_many :project_type_tags, dependent: :destroy
  # has_many :type_tags, through: :project_type_tags

  scope :by_company_id, -> (id) { where(company_id: id) }
end
