require_relative '../io_purchase'
require_relative '../purchase'

RSpec.describe IOPurchase do
  let(:purchase) { instance_double('Purchase') }

  before do
    allow(Purchase).to receive(:new).and_return(purchase)
    allow(purchase).to receive(:purchase_basket)
  end

  describe '#interactive_purchase' do
    it 'adds valid items to the input list and calls purchase_basket' do
      allow_any_instance_of(Object).to receive(:gets).and_return(
        "2 book at 12.49\n", "done\n"
      )
      expect(purchase).to receive(:purchase_basket).with(['2 book at 12.49'])
      IOPurchase.new.interactive_purchase
    end

    it 'rejects blank entries with a message' do
      allow_any_instance_of(Object).to receive(:gets).and_return(
        "\n", "done\n"
      )
      expect { IOPurchase.new.interactive_purchase }.to output(/Item cannot be blank/).to_stdout
    end

    it 'prompts user again on invalid format' do
      allow_any_instance_of(Object).to receive(:gets).and_return(
        "2 book 12.49\n", "done\n"
      )
      expect { IOPurchase.new.interactive_purchase }.to output(/Invalid format/).to_stdout
    end
  end

  describe '#valid_input_format?' do
    it 'returns true for correctly formatted input' do
      expect(IOPurchase.new.valid_input_format?('2 book at 12.49')).to be true
    end

    it 'returns false for incorrectly formatted input' do
      expect(IOPurchase.new.valid_input_format?('2 book 12.49')).to be false
    end
  end
end
