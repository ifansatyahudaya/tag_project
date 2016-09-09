class Role < ActiveRecord::Base
  IDS = { SUPER_ADMIN: 10, ADMIN: 11, USER: 12 }
  has_many :users
end
