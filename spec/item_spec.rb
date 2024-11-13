require_relative '../item'
require_relative 'item_helper'

RSpec.describe Item do
  include ItemHelper
  context 'when calculating sales tax' do
    it 'calculates sales tax correctly for a taxable item' do
      item = create_item(1, 'music CD', 14.99, false, false)

      expect(item.sales_tax).to eq(1.5)
    end

    it 'calculates zero sales tax for exempt items' do
      item = create_item(1, 'book', 12.49, false, true)

      expect(item.sales_tax).to eq(0)
    end

    it 'calculates import duty for imported items' do
      item = create_item(1, 'imported bottle of perfume', 27.99, true, false)

      expect(item.sales_tax).to eq(4.2)
    end

    it 'calculates sales tax correctly for multiple quantities of a taxable item' do
      item = create_item(3, 'imported box of chocolates', 11.25, true, true)

      expect(item.sales_tax).to eq(1.8)
    end
  end


  context 'when handling rounding' do
    it 'rounds up tax to nearest 0.05' do
      item = create_item(1, 'imported box of chocolates', 11.25, true, true)

      expect(item.sales_tax).to eq(0.6)
    end

    it 'rounds up tax to the nearest 0.05 for boundary values' do
      item = create_item(1, 'imported box of chocolates', 10.01, true, true)

      expect(item.sales_tax).to eq(0.55)
    end
  end

  context 'when handling special cases' do
    it 'handles zero price items without applying any sales tax' do
      item = create_item(1, 'book', 0.00, false, true)

      expect(item.sales_tax).to eq(0)
    end
  end
end