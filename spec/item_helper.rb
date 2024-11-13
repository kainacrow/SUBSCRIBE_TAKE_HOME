module ItemHelper
  def create_item(quantity, name, price, is_imported, is_exempt)
    item = Item.new(quantity, name, price)
    allow(item).to receive(:is_imported).and_return(is_imported)
    allow(item).to receive(:is_exempt).and_return(is_exempt)
    item
  end
end
