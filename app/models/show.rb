class Show < ActiveRecord::Base
  has_many :characters
  has_many :actors, through: :characters
  belongs_to :network

  def actors_list
    self.characters.map {|character| Actor.find(character.actor_id).full_name}
  end

  
end