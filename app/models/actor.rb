class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters
  has_many :networks, through: :shows

  def full_name
    "#{first_name} #{last_name}"
  end

  def list_roles
    require 'pry'
    binding.pry
    self.characters.includes(:show).map do |c|
      "#{c.name} - #{c.show.name}"
    end
  end

end
