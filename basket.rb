require_relative 'item'

class Basket
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def total_sales_tax
    @items.sum(&:sales_tax)
  end

  def total_price
    @items.sum(&:total_price)
  end

  def print_receipt
    @items.each do |item|
      puts "#{item.quantity} #{item.name}: #{'%.2f' % item.total_price}"
    end
    puts "Sales Taxes: #{'%.2f' % total_sales_tax}"
    puts "Total: #{'%.2f' % total_price}"
  end
end
