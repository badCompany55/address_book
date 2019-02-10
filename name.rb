class Name

  attr_reader :last_name, :first_name

  def initialize
    @last_name
    @first_name
    @full_name = {}
  end

  def get_name
    puts "First Name: "
    @first_name = $stdin.gets.chomp
    puts "Last Name: "
    @last_name = $stdin.gets.chomp
  end

  def full_name
   full_name = {
      'first_name' => first_name,
      'last_name' => last_name
    }
    return full_name
  end

end


