class CashRegister
  attr_reader :total, :discount, :item_cart
  attr_accessor :items, :last_item

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_item = {}
  end

  def total=(total)
    @total = total
  end

  def add_item(item_name, price, quantity = 1)
    self.last_item[item_name] = {
      :price => price,
      :quantity => quantity
    }

    quantity.times do
      self.items << item_name
    end

    self.total += price * quantity
  end

  def apply_discount
    if self.discount == 0
      return "There is no discount to apply."
    end

    self.total *= ((100 - self.discount)/100.00)
    "After the discount, the total comes to $#{self.total.to_i}."
  end

  def void_last_transaction
    last = self.last_item[self.items.pop]
    self.total -= last[:price] * last[:quantity]
  end
end
