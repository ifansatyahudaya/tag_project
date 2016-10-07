# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  company_id  :integer
#
# Indexes
#
#  index_projects_on_company_id  (company_id)
#  index_projects_on_user_id     (user_id)
#

class Project < ActiveRecord::Base
  acts_as_taggable_on :tags

  validates :name, :company, :user, presence: true

  belongs_to :company
  belongs_to :user

  has_many :project_users
  has_many :users, through: :project_users

  def tags
    Tag.where(id: self.tag_ids)
  end

  scope :by_company_id, -> (id) { where(company_id: id) }
end
