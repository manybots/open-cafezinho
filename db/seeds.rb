# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Machine.create :name => 'Default Machine', :slug => 'default', :description => 'Choose this machine in case of doubt', :is_public => true


Brand.create :name => 'Regular'
Brand.create :name => 'Nespresso'


CoffeeType.create :name => 'Expresso', :brand_id => 1
CoffeeType.create :name => 'Volutto', :brand_id => 2
CoffeeType.create :name => 'Ristretto', :brand_id => 2
CoffeeType.create :name => 'Arpeggio', :brand_id => 2