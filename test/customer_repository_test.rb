require_relative 'test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/customer_repository'
require_relative '../lib/csv_parser'

class CustomerRepositoryTest < MiniTest::Test
  attr_reader :cr

  def setup
    @cr = CustomerRepository.new
    cr.from_csv("./data/customers_test.csv")
    end

  def test_it_returns_array_of_all_customers
    assert_equal Array, cr.all.class
  end

  def test_it_finds_invoice_item_by_id
    assert_equal "Harry", cr.find_by_id(2).first_name
  end

  def test_it_returns_array_from_first_name_fragment
    assert_equal Array, cr.find_all_by_first_name("H").class
  end

  def test_it_returns_multiple_customer_objects_from_first_name_fragment_match
    assert_equal 2, cr.find_all_by_first_name("H").length
  end

  def test_it_returns_array_from_first_name_fragment
    assert_equal Array, cr.find_all_by_last_name("Wi").class
  end

  def test_it_returns_customer_object_from_last_name_fragment_match
    assert_equal 1, cr.find_all_by_last_name("Wi").length
  end

  def test_find_all_by_item_id_returns_empty_arr_if_match_does_exist
    assert_equal [], cr.find_all_by_last_name("We")
  end

end
