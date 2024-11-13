require_relative '../purchase'
require_relative '../item'
require_relative '../basket'

RSpec.describe Purchase do
  let(:basket) { instance_double('Basket') }
  let(:item) { instance_double('Item') }

  before do
    allow(Basket).to receive(:new).and_return(basket)
    allow(basket).to receive(:add_item)
    allow(basket).to receive(:print_receipt)
    allow(Item).to receive(:new).and_return(item)
  end

  describe '#purchase_basket' do
    it 'adds items to the basket and prints the receipt' do
      input = ['2 book at 12.49', '1 music CD at 14.99']
      expect(basket).to receive(:add_item).twice
      expect(basket).to receive(:print_receipt)
      Purchase.new.purchase_basket(input)
    end

    it 'creates Item objects with correct parameters' do
      input = ['2 book at 12.49']
      expect(Item).to receive(:new).with(2, 'book', 12.49)
      Purchase.new.purchase_basket(input)
    end
  end
end
