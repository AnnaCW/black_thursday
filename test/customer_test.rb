require_relative 'test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/customer'

class CustomerTest < MiniTest::Test
  attr_reader :c

  def setup
    @c = Customer.new(
        { :id => "2",
          :first_name => "Harry",
          :last_name => "Wilson",
          :created_at => "2014-03-27 14:54:09 UTC",
          :updated_at => "2016-04-28 15:54:09 UTC"
        }
      )
  end

  def test_it_returns_id_as_an_integer
    assert_equal 2, c.id
  end

  def test_it_returns_first_name_as_string
    assert_equal "Harry", c.first_name
  end

  def test_it_returns_last_name_as_string
    assert_equal "Wilson", c.last_name
  end

  def test_it_returns_the_time_customer_created
    assert_equal "2014-03-27 14:54:09 UTC", c.created_at.to_s
  end

  def test_it_returns_the_time_customer_was_last_updated
    assert_equal "2016-04-28 15:54:09 UTC", c.updated_at.to_s
  end

  def test_it_returns_a_time_object_for_created_and_updated_at
    assert_equal Time, c.created_at.class
    assert_equal Time, c.updated_at.class
  end

end
