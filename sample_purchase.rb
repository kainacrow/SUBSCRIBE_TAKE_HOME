require_relative 'purchase'
def sample_purchase
  input_1 = ['2 book at 12.49', '1 music CD at 14.99', '1 chocolate bar at 0.85']
  input_2 = ['1 imported box of chocolates at 10.00', '1 imported bottle of perfume at 47.50']
  input_3 = ['1 imported bottle of perfume at 27.99', '1 bottle of perfume at 18.99', '1 packet of headache pills at 9.75', '3 imported boxes of chocolates at 11.25']

  purchase = Purchase.new
  puts "Output 1:"
  purchase.purchase_basket(input_1)
  puts "\nOutput 2:"
  purchase.purchase_basket(input_2)
  puts "\nOutput 3:"
  purchase.purchase_basket(input_3)
end
