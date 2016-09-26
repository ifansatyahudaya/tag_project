class ProjectUser < ActiveRecord::Base
  belongs_to :project, inverse_of: :project_users
  belongs_to :user, inverse_of: :project_users  

  validates :user, :project, presence: true
end
