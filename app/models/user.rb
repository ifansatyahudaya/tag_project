class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :company_name, :company_subdomain
  validates :name, :email, :password, :password_confirmation, presence: true
  belongs_to :company
  belongs_to :role

  has_many :projects, dependent: :destroy 
  has_many :project_users, autosave: false
  has_many :shared_projects, through: :project_users, 
    foreign_key: :project_id, source: :project

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :set_role
  after_create :set_company
  scope :all_except, ->(user) { where.not(id: user) }
  scope :by_company_id, -> (id) { where(company_id: id) }

  def is_super_admin?
    self.role_id == Role::IDS[:SUPER_ADMIN]
  end

  def is_admin?
    self.role_id == Role::IDS[:ADMIN]
  end

  def is_user?
    self.role_id == Role::IDS[:USER]
  end

  private

  def set_role
    self.role_id ||= Role::IDS[:ADMIN]
  end

  def set_company
    if self.company_id == nil
      company = Company.create(name: self.company_name, subdomain: self.company_subdomain)  
      self.company_id = company.id
      self.save
    end
  end
end 