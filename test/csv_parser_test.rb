require_relative 'test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/csv_parser'

class CsvParserTest < Minitest::Test

  attr_reader :parser

  def setup
    @parser = CsvParser.new
  end

  def test_it_instantiates_parser
    assert parser
  end

  def test_it_parses_merchant_csv_into_a_hash
    assert_equal Hash, parser.collect_data( { :merchants => "./data/merchants.csv" } ).class
  end

  def test_it_parses_each_merchant_into_hash
    assert_equal "12334105", parser.collect_data( { :merchants => "./data/merchants.csv" } )[:merchants][0][:id]
  end

  def test_it_parses_each_item_into_hash_and_finds_id
    assert_equal "263395237", parser.collect_data( { :items => "./data/items.csv" } )[:items][0][:id]
  end

  def test_it_parses_each_item_into_hash_and_finds_name
    assert_equal "510+ RealPush Icon Set", parser.collect_data( { :items => "./data/items.csv" } )[:items][0][:name]
  end

end
