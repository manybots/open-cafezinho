# encoding: utf-8

class Drink < ActiveRecord::Base
  belongs_to :user
  belongs_to :machine
  belongs_to :coffee_type
  has_one :favorite, :dependent => :destroy
  
  after_create :post_to_manybots
  
  def post_to_manybots
    activity = {
       published: "#{self.created_at}",
       url: "https://cafezinho.herokuapps.com/drinks",
       id: "https://cafezinho.herokuapps.com/drinks/#{self.id}",
       title: "ACTOR drank a OBJECT from TARGET",
       auto_title: true,
       summary: "",
       content: "",
       actor: {
         displayName: "#{self.user.name}",
         url: "https://www.manybots.com/users/#{self.user.manybots_user_id}",
         id: "https://www.manybots.com/users/#{self.user.manybots_user_id}"
       },
       verb: "drink",
       tags: [],
       object: {
         id: "https://cafezinho.herokuapp.com/drinks/#{self.id}",
         url: "https://cafezinho.herokuapp.com/drinks",
         objectType: "coffee",
         displayName: "#{self.coffee_type.brand.name} #{self.coffee_type.name}"
       },
       target: {
         id: "https://cafezinho.herokuapp.com/at/#{self.machine.slug}",
         url: "https://cafezinho.herokuapp.com/at/#{self.machine.slug}",
         objectType: "coffee-machine",
         displayName: "#{self.machine.name}"
       },
       icon: {
         url: "https://cafezinho.herokuapp.com/assets/cafezinho/expresso32.png",
         width: "32px",
         height: "32px"
       }, 
       generator: {
   		   displayName: "Cafézinho",
   		   url: "https://cafezinho.herokuapp.com",
   		   image: {
   		     url: "https://cafezinho.herokuapp.com/assets/cafezinho/expresso32.png",
   		     width: "32px",
   		     height: "32px"
   		  }
       },          
       provider: {
         displayName: "Cafézinho",
         url: "https://cafezinho.herokuapp.com",
         image: {
           url: "https://cafezinho.herokuapp.com/assets/cafezinho/expresso32.png",
           width: "32px",
           height: "32px"
         }
       }
     }
    puts self.user.post_to_manybots!(activity).body.inspect
  end
end
