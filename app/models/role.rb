class Role < ActiveRecord::Base
  IDS = { SUPER_ADMIN: 1, ADMIN: 2, USER: 3 }
  has_many :users
end
