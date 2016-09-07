class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :role
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :set_role

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
end
