class Machine < ActiveRecord::Base
  belongs_to :user
  belongs_to :brand
  has_many :drinks
  has_many :coffee_types, :through => :drinks
  
  validates_presence_of :name, :slug
  validates_uniqueness_of :slug
end
