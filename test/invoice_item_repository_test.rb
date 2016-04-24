require_relative 'test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice_item_repository'
require_relative '../lib/csv_parser'

class InvoiceItemRepositoryTest < MiniTest::Test
  attr_reader :iir

  def setup
    @iir = InvoiceItemRepository.new
    iir.from_csv("./data/invoice_items.csv")
  end

  def test_it_returns_array_of_all_invoice_item_instances
    assert_equal Array, iir.all.class
  end

  def test_it_returns_all_invoice_item_instances
    assert_equal 21830, iir.all.length
  end

  def test_it_finds_invoice_item_by_id
    assert_equal "9", iir.find_by_id(2).quantity
  end

  def test_it_returns_nil_if_id_does_not_exist
    assert_equal nil, iir.find_by_id(999999999)
  end

  def test_find_all_by_item_id_finds_all_matching_items
    assert_equal 164, iir.find_all_by_item_id(263519844).length
  end

  def test_find_all_by_item_id_returns_empty_arr_if_match_does_exist
    assert_equal [], iir.find_all_by_item_id(8888)
  end

  def test_find_all_by_invoice_id_finds_all_matching_items
    assert_equal 8, iir.find_all_by_invoice_id(1).length
  end

  def test_find_all_by_invoice_id_returns_empty_arr_if_match_does_not_exist
    assert_equal [], iir.find_all_by_invoice_id(99999999)
  end
end
