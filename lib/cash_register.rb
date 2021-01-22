require 'pry'
class CashRegister
    attr_accessor :total, :discount, :last

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        self.total += price * quantity
        @items << title
        @last = price
        @quantity = quantity
        i = 1
        if quantity > 1 
            while i < quantity
                i += 1
                @items << title
            end
            
        end
         
    end

    def apply_discount
        if @discount > 0
            percent = @discount.to_f / 100
            @discount = self.total * percent
            self.total -= @discount
            self.total = self.total.round
            return "After the discount, the total comes to $#{self.total}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @total -= @last
        @items.pop
        i = 1
        if @quantity > 1
            while i < @quantity
                i += 1
                @items.pop
                @total -= @last
            end
        end
    end

        
end
