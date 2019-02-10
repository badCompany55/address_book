require './contact.rb'
require "yaml"

class Book

  attr_reader :contacts

  def initialize
    @contacts = []
    @searchResults = []
    open
  end

  def open
    if File.exist?("contacts.yml")
      @contacts = YAML.load_file("contacts.yml")
    end
  end

  def save
    File.open("contacts.yml", 'w') do |file|
      file.write(contacts.to_yaml)
    end
  end

  def delete(contact)
    @contacts.each do |cont|
      if cont.contact["name"] == contact
        @contacts.delete(cont)
      end
    end
  end

  def searchAndDelete
    search
    puts "Are you sure you want to delete #{@searchResults[0].contact["name"]} (Y/N) ?"
    answer = $stdin.gets.chomp
    if answer.downcase == "y" 
      delete(@searchResults[0].contact["name"])
    end
  end

  def search
    print "Search Input: "
    input = $stdin.gets.chomp.downcase
    copyOfContacts = @contacts
    @searchResults = []
    copyOfContacts.each do |c|
      if c.contact["name"]["first_name"].downcase.include?(input) or  c.contact["name"]["last_name"].downcase.include?(input)
        @searchResults << c
      end
    end
    puts @searchResults
  end

  def viewContacts
    @contacts.each do |c|
      puts "-" * 50
      puts ""
      puts "Name: #{c.contact["name"]["first_name"]}, #{c.contact["name"]["last_name"]}" 
      c.contact["email"].each do |e|
        puts "Email: #{e["email"]}"
      end
      puts ""
      puts "Addresses"
      puts ""
      c.contact["addresses"].each do |a|
        puts "Type: #{a["distinction"]}"
        puts "Street One: #{a["streetOne"]}"
        puts "Street Two: #{a["streetTwo"]}"
        puts "City: #{a["city"]}"
        puts "State: #{a["state"]}"
        puts "Zip: #{a["zip"]}"
        puts ""
      end
      puts "-" * 50
    end
  end

  def viewSearch
    if @searchResults.length > 0
      @searchResults.each do |c|
        puts "-" * 50
        puts ""
        puts "Name: #{c.contact["name"]["first_name"]}, #{c.contact["name"]["last_name"]}" 
        c.contact["email"].each do |e|
          puts "Email: #{e["email"]}"
        end
        puts ""
        puts "Addresses"
        puts ""
        c.contact["addresses"].each do |a|
          puts "Type: #{a["distinction"]}"
          puts "Street One: #{a["streetOne"]}"
          puts "Street Two: #{a["streetTwo"]}"
          puts "City: #{a["city"]}"
          puts "State: #{a["state"]}"
          puts "Zip: #{a["zip"]}"
          puts ""
        end
        puts "-" * 50
      end
    else puts "No Results found"
    end
  end

  def theInput 
    puts "Add New Contact (A)"
    puts "View Contacts (V)"
    puts "Search Contacts (SE)"
    puts "Delete Contacts (D)"
    puts "Save Contacts (SA)"
    puts "Exit (E)"
  end

  def screen
    theInput
    answer = $stdin.gets.chomp
    while answer.downcase != 'e'
      if answer.downcase == 'a'

        new_contact = Contact.new
        new_contact.name

        new_contact.email
        puts "Another Email? (Y/N)"
        nAnswer = $stdin.gets.chomp

        until nAnswer.downcase == 'n' 
          new_contact.email
          puts "Another Email? (Y/N)"
          nAnswer = $stdin.gets.chomp
        end

        new_contact.address
        puts "Another address? (Y/N)"
        aAnswer = $stdin.gets.chomp
       
        until aAnswer == 'n'
          new_contact.address
          puts "Another address? (Y/N)"
          aAnswer = $stdin.gets.chomp
        end

        @contacts << new_contact
        theInput
        answer = $stdin.gets.chomp

      elsif answer.downcase == 'v'
        viewContacts
        theInput
        answer = $stdin.gets.chomp

      elsif answer.downcase == 'se'
        search
        viewSearch
        theInput
        answer = $stdin.gets.chomp

      elsif answer.downcase == 'sa'
        save
        theInput
        answer = $stdin.gets.chomp

      elsif answer.downcase == 'd'
        searchAndDelete
        theInput
        answer = $stdin.gets.chomp

      else answer.downcase == 'e'
        break
      end
    end
  end

end

book = Book.new

book.screen


