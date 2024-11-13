require_relative '../basket'
require_relative '../item'
require_relative 'item_helper'

RSpec.describe Basket do
  include ItemHelper
  before do
    @basket = Basket.new
  end

  it 'calculates total sales tax for multiple items' do
    @items = [
      create_item(2, 'book', 12.49, false, true),
      create_item(1, 'music CD', 14.99, false, false),
      create_item(1, 'chocolate bar', 0.85, false, true)
    ]

    @items.each { |item| @basket.add_item(item) }

    expect(@basket.total_sales_tax).to eq(1.50)
  end

  it 'calculates total price including sales tax' do
    @items = [
      create_item(1, 'imported bottle of perfume', 27.99, true, false),
      create_item(1, 'bottle of perfume', 18.99, false, false),
      create_item(1, 'packet of headache pills', 9.75, false, true),
      create_item(3, 'imported boxes of chocolates', 11.25, true, true)
    ]
    @items.each { |item| @basket.add_item(item) }

    expect(@basket.total_sales_tax).to eq(7.9)
    expect(@basket.total_price).to eq(98.38)
  end
end
