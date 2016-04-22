require 'bigdecimal'

class InvoiceItem
  attr_reader :id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at

  def initialize(invoice_item_data)
    @id = invoice_item_data[:id].to_i
    @item_id = invoice_item_data[:item_id].to_i
    @invoice_id = invoice_item_data[:invoice_item_id].to_i
    @quantity = invoice_item_data[:quantity]
    @unit_price = unit_price_to_dollars(item_information[:unit_price])
    @created_at = invoice_item_id[:created_at]
    @updated_at = invoice_item_id[:updated_at]
  end

  def unit_price_to_dollars(price)
    BigDecimal.new(price) / 100
  end
end