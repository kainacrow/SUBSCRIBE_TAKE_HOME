require_relative 'item'
require_relative 'basket'
class Purchase
  def purchase_basket(input)
    basket = Basket.new
    input.each do |line|
      quantity, name_price = line.split(" ", 2)
      name, price = name_price.split(" at ", 2) # spaces before/after 'at' required bc 'at' may appear in a word (eg. chocolate)
      quantity = quantity.to_i
      price = price.to_f
      item = Item.new(quantity, name, price)
      basket.add_item(item)
    end
    basket.print_receipt
  end
end
