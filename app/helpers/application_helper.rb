module ApplicationHelper

  def formatted_price price
    number_to_currency price, separator: '.', unit: '€', format: '%n %u'
  end

  def hidden_div_if(condition, attributes={}, &block)
    if condition
      attributes['style'] = 'display: none'
    end
    content_tag(:div, attributes, &block)
  end
end
