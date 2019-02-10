class Address

  attr_accessor :addresses

  def initialize
    @addresses = []
  end


  def get_address
    type = ""
   until type == "home" || type == "work"
      puts "Address Type: (Home / Work)"
      type = $stdin.gets.chomp.downcase
    end

    puts "Address One: "
    streetOne = $stdin.gets.chomp
    puts "Address Two: "
    streetTwo = $stdin.gets.chomp
    puts 'City: '
    city = $stdin.gets.chomp
    puts "State: "
    state = $stdin.gets.chomp
    puts 'Zip: '
    zip = $stdin.gets.chomp
    address = {
      'distinction' => type, 'streetOne' => streetOne, 'streetTwo' => streetTwo, 'city' => city, 'state' => state, 'zip' => zip

    } 

    return address
    # if @type == 'home'.downcase
    #   @home = {
    #     'type' => @type, 'streetOne' => streetOne, 'streetTwo' => streetTwo, 'city' => city, 'state' => state, 'zip' => zip
    #   }
    # elsif @type == 'work'.downcase
    #   @work = {
    #     'type' => @type, 'streetOne' => streetOne, 'streetTwo' => streetTwo, 'city' => city, 'state' => state, 'zip' => zip
    #   }
    # end
  end

end
