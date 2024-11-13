class Item
  attr_reader :name, :price, :quantity, :is_imported, :is_exempt

  FOOD_PRODUCTS = %w[chocolate]
  MEDICAL_PRODUCTS = %w[pill]
  EXEMPT_ITEMS = %w[book] + FOOD_PRODUCTS + MEDICAL_PRODUCTS
  ROUNDED_AMOUNT = 0.05.freeze

  def initialize(quantity, name, price)
    @quantity = quantity
    @name = name
    @price = price
    @is_imported = name.downcase.include?("imported")
    @is_exempt = EXEMPT_ITEMS.any? { |exempt_item| name.downcase.include?(exempt_item) }
  end

  def sales_tax
    basic_sales_tax = is_exempt ? 0 : 0.10
    import_duty = is_imported ? 0.05 : 0
    total_sales_tax = basic_sales_tax + import_duty
    (rounded_taxes(total_sales_tax * price, ROUNDED_AMOUNT) * quantity).round(2)
  end

  def total_price
    (price * quantity) + sales_tax
  end

  private def rounded_taxes(number, n)
    (number / n).ceil * n
  end
end
