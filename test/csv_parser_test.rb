require_relative 'test_helper'
require 'minitest/autorun'
require_relative '../lib/csv_parser'

class CsvParserTest < Minitest::Test
  attr_reader :parser, :transactions

  def setup
    @parser = CsvParser.new.collect_data({
      :transactions => "./test/test_csvs/transactions_test.csv"
    })
    @transactions = parser[:transactions]
  end

  def it_instantiates_parser
    assert parser
  end

  def test_it_parses_data_into_array_of_hashes
    assert_equal Array, transactions.class
    assert_equal Hash, transactions[0].class
  end

  def test_it_finds_first_transaction
    assert_equal "1", transactions[0][:id]
  end

  def test_it_loads_all_transactions
    assert_equal 50, transactions.count
  end

end
