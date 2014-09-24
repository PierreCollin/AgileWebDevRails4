module ApplicationHelper

	def formatted_price price
		number_to_currency price, separator: '.', unit: '€', format: '%n %u'
	end

end
