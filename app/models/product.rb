# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string
#  qty        :integer
#  price      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ActiveRecord::Base
  acts_as_taggable
end
