require_relative 'test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/sales_analyst'
require_relative '../lib/sales_engine'

class SalesAnalystTest < MiniTest::Test
  attr_reader :sa

  def setup
    se = SalesEngine.from_csv({
      :items     => "./data/items_test.csv",
      :merchants => "./data/merchants_test.csv",
      :invoices => "./data/invoices_test.csv",
      :invoice_items =>
      "./data/invoice_items_test.csv",
      :transactions => "./data/transactions_test.csv",
      :customers => "./data/customers_test.csv",
    })
    @sa = SalesAnalyst.new(se)
  end

  def test_it_itializes_sales_analyst
    assert sa
  end

  def test_it_finds_number_of_items_for_each_merchant
    assert_equal 3, sa.items_per_merchant.length
  end

  def test_it_finds_average_items_per_merchant
    assert_equal 1.33, sa.average_items_per_merchant
  end

  def test_it_finds_standard_deviation
    assert_equal 0.58, sa.average_items_per_merchant_standard_deviation
  end

  def test_it_finds_merchants_with_high_item_count
    assert_equal 1, sa.merchants_with_high_item_count.count
  end

  # def test_it_returns_merchants_in_an_array_with_their_item_count
  #   assert_equal "Shopin1901", sa.merchants_with_item_counts[0][0].name
  # end
#   #more tests for method
#
  def test_it_returns_merchants_all_in_an_array_with_their_item_count
    assert_equal 3, sa.merchants_with_item_counts.count
  end
#
  def test_it_makes_average_merchant_unit_price_for_one_item
    assert_equal 2.0, sa.average_item_price_for_merchant(12334113).to_f
  end

  # def test_it_can_average_item_prices_of_multiple_items
  #   assert_equal 123.5, sa.average_item_price_for_merchant(12334115).to_f
  # end

  def test_it_finds_average_average_item_price_for_merchant
    assert_equal 3.5, sa.average_average_price_per_merchant.to_f.round(2)
  end

  def test_it_finds_all_items_unit_prices
    assert_equal 6, sa.all_items_unit_prices.count
  end

  def test_it_finds_average_items_price
    assert_equal 6.33, sa.average_items_price.to_f.round(2)
  end

  def test_it_finds_items_price_standard_deviation
    assert_equal 4.37, sa.items_price_standard_deviation.to_f.round(2)
  end

  def test_it_finds_golden_items
    assert_equal 1, sa.golden_items.count
  end

  def test_it_finds_average_invoices_per_merchant
    assert_equal 1.67, sa.average_invoices_per_merchant
  end

  def test_it_finds_top_merchants_by_invoice_count
    assert_equal 0, sa.top_merchants_by_invoice_count.count
  end

  def test_it_finds_bottom_merchants_by_invoice_count
    assert_equal 0, sa.bottom_merchants_by_invoice_count.count
  end

  def test_it_finds_invoices_by_day
    assert sa.days_with_invoices
  end

  def test_it_counts_invoices_per_day_small_data_set
    assert_equal [{"Saturday"=>1}, {"Friday"=>1}, {"Wednesday"=>1}, {"Monday"=>2}], sa.days_with_count
  end

  def test_it_finds_invoices_by_week_day_small_data_set
    assert_equal [1, 1, 1, 2],  sa.invoices_by_day
  end

  def test_it_finds_average_invoices_per_week_day
    assert_equal 1,  sa.invoices_by_day_average
  end

  def test_it_finds_top_days
    assert_equal ["Monday"], sa.top_days_by_invoice_count
  end

  def test_it_returns_invoice_status_pending
    assert_equal 60, sa.invoice_status(:pending)
  end

  def test_it_returns_invoice_status_shipped
    assert_equal 40, sa.invoice_status(:shipped)
  end

  # def test_it_finds_total_revenue_by_date_when_all_dates_included
  #   assert_equal 71832.0, sa2.total_revenue_by_date("2013-03-27 14:54:09 UTC").to_f*100
  # end

  # def test_it_finds_total_revenue_by_date
  #   assert_equal 13635.0, sa2.total_revenue_by_date("2012-04-27 14:54:09 UTC").to_f*100
  # end

  def test_it_finds_merchants_with_pending_invoices
    assert_equal 3, sa.merchants_with_pending_invoices.length
  end

  def test_it_finds_merchants_with_one_item
    assert_equal 2, sa.merchants_with_only_one_item.length
  end

  def test_it_finds_most_sold_items_for_merchant
    assert_equal [], sa.most_sold_item_for_merchant(12334105)
  end

  def test_it_finds_most_sold_items_for_merchant
    assert_equal 1, sa.most_sold_item_for_merchant(12334105).length
  end

  def test_it_finds_best_item_for_merchant
    assert_equal 223456789, sa.best_item_for_merchant(12334105).id
  end

end
