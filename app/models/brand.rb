class Brand < ActiveRecord::Base
  has_many :coffee_types, :order => 'name ASC'
  has_many :machines
end
