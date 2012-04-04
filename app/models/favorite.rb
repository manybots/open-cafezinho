class Favorite < ActiveRecord::Base
  belongs_to :drink
  belongs_to :user
end
