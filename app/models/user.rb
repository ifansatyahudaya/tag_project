class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :company_name, :company_subdomain
  belongs_to :company
  belongs_to :role
  has_many :projects
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :set_role
  after_create :set_company

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
    self.role_id ||= Role::IDS[:USER]
  end

  def set_company
    company = Company.create(name: self.company_name, subdomain: self.company_subdomain)
    self.company_id = company.id
    self.save
  end
end
