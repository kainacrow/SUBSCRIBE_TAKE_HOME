require_relative 'sample_purchase'
require_relative 'io_purchase'

def get_user_choice
  puts "Would you like to make an interactive purchase or run the sample file? (type 'interactive' or 'sample')"
  print "Purchase Type: "
  choice = gets.chomp.downcase

  until %w[interactive sample].include?(choice)
    puts "Invalid choice. Please type 'interactive' to submit items via user input or 'sample' to run the sample file."
    print "Purchase Type: "
    choice = gets.chomp.downcase
  end
  choice
end

# this will only be run when main.rb is executed directly, not when required by a test
if __FILE__ == $PROGRAM_NAME
  choice = get_user_choice
  if choice == 'interactive'
    IOPurchase.new.interactive_purchase
  else
    sample_purchase
  end
end
