# == Schema Information
#
# Table name: companies
#
#  id        :integer          not null, primary key
#  name      :string
#  subdomain :string
#

class Company < ActiveRecord::Base
  has_many :users, dependent: :destroy
  has_many :projects, dependent: :destroy
end
