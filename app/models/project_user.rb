# == Schema Information
#
# Table name: project_users
#
#  id         :integer          not null, primary key
#  project_id :integer
#  user_id    :integer
#
# Indexes
#
#  index_project_users_on_project_id  (project_id)
#  index_project_users_on_user_id     (user_id)
#

class ProjectUser < ActiveRecord::Base
  belongs_to :project, inverse_of: :project_users
  belongs_to :user, inverse_of: :project_users  

  validates :user, :project, presence: true
end
