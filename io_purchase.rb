require_relative 'purchase'
class IOPurchase
  def interactive_purchase
    puts "Enter each item in the format 'quantity item_name at price_per_item (ex. 5 chocolate bars at 12.99)'. Type 'done' when finished."
    input = []

    loop do
      print "Item: "
      line = gets.chomp

      break if line.downcase == 'done'

      if line.strip.empty?
        puts "Item cannot be blank. Please enter an item."
      elsif valid_input_format?(line)
        input << line
      else
        puts "Invalid format. Please enter in the format 'quantity item name at price'."
      end
    end

    puts "\nReceipt:"
    Purchase.new.purchase_basket(input)
  end

  def valid_input_format?(input)
    # Check if the input matches the expected pattern:
    # quantity item_name at price_per_item
    # integer anything at float
    !!(input.match(/^\d+ .+ at \d+(\.\d{2})?$/))
  end
end
