class CashRegister
	attr_accessor :discount, :total, :items


	def initialize(discount = 0)
		@total = 0
		@discount = discount
		@items = []
		@transaction_array = []
	end

	def discount
		@discount
	end

	def transaction_array
		#this is an array of prices
		@transaction_array
	end

	def items
		@items
	end

	def add_item(title, price, quantity = 1)
		prev_total = self.total
		@quantity = quantity
		total_price = price * quantity
		@total = self.total += total_price
		@transaction_array << total_price


		i = 0
		while i<@quantity
			@items << title
			i += 1
		end
	end

	def apply_discount
		if self.discount != 0
			discount_amount = self.total*(self.discount/100.0)
			discount_total = self.total - discount_amount
			@total = discount_total.round
			"After the discount, the total comes to $#{discount_total.round}."
		else
			"There is no discount to apply."
		end
	end


	def void_last_transaction
		@total -= self.transaction_array[-1]
	end


end

