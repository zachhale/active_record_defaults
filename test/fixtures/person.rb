class Person < ActiveRecord::Base
  defaults :city => 'Christchurch', :country => Proc.new { 'New Zealand' }
  
  default :first_name => 'Sean'
  
  default :last_name do
    'Fitzpatrick'
  end
  
  defaults :lucky_number => lambda { 2 }, :favourite_colour => :default_favourite_colour
  
  def defaults
    self.birthdate = Date.new(2006, 10, lucky_number) if lucky_number?
  end
  
  def default_favourite_colour
    "Blue"
  end
  
  # Include an aggregate reflection to check compatibility
  composed_of :address, :mapping => [%w(address_suburb suburb), %{address_city city}]
  
  belongs_to :school
end
