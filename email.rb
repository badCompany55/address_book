class Email

  attr_accessor :email

  def initialize
    @email
  end

  def get_email
    puts "Email: "
    getemail = $stdin.gets.chomp
    @email = {
      'email' => getemail
    }
    return @email
  end

end
