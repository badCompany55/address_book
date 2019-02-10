class PhoneNumber

  attr_reader :work, :home, :other

  def initialize
    @work
    @home
    @other
  end

  def get_work
    puts "Phone Number: "
    number = $stdin.gets.chomp
    @work = {
      'type' => 'work',
      'number' => number
    }
  end

  def get_home
    puts "Phone Number: "
    number = $stdin.gets.chomp
    @home = {
      'type' => 'home',
      'number' => number
    }
  end

  def get_other
    puts "Phone Number: "
    number = $stdin.gets.chomp
    @other = {
      'type' => 'other',
      'number' => number
    }
  end

end
