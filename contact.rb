require './address.rb'
require './email.rb'
require './name.rb'
require './phone_number.rb'

class Contact

  attr_reader :contact

  def initialize
    @contact = {
      "addresses" => [],
      "email" => []
    } 
  end

  def name
    name = Name.new
    name.get_name
    @contact["name"] = name.full_name
  end

  def email 
    email = Email.new
    email.get_email
    @contact["email"] << email.email 
  end


  def address 
      address = Address.new
      # address.get_address
      @contact["addresses"] << address.get_address
    
  end

end
