# == Schema Information
#
# Table name: line_items
#
#  id         :integer          not null, primary key
#  product_id :integer
#  cart_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  quantity   :integer          default(1)
#  price      :decimal(, )
#

require 'test_helper'

class LineItemTest < ActiveSupport::TestCase

end
