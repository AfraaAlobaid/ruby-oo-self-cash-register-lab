class CashRegister
    attr_accessor :total, :discount, :items, :prices
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @prices = []
        @items = []
    end

    def add_item(title, price, q=1)
        @prices << (price * q)
        @total = @total + (price * q)
        q.times do
            @items << title
        end
    end

    def apply_discount
        if @discount == 0
            return "There is no discount to apply."
        end
        @total = @total - ((@discount / 100.0) * @total)
        "After the discount, the total comes to $#{total.round}."
    end

    def void_last_transaction
        if @prices[-1]
            @total = @total - @prices[-1]
            @prices.pop
        end
    end

end