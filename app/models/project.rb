class Project < ActiveRecord::Base
  acts_as_taggable_on :tags

  validates :name, presence: true

  belongs_to :company
  belongs_to :user

  has_many :project_users
  has_many :users, through: :project_users

  scope :by_company_id, -> (id) { where(company_id: id) }
end
