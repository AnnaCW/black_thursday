require_relative 'customer'

class CustomerRepository
  attr_reader :customers

  def initialize(customers_data)
    @customers = create_customers(customers_data)
  end

  def create_customers(customers_data)
    customers_data.map do |cust|
      Customer.new(cust)
    end
  end

  def all
    customers
  end

  def find_by_id(id)
    customers.find {|c| c.id == id}
  end

  def find_all_by_first_name(first_name_fragment)
  end
#returns [] or match(es)

  def find_all_by_last_name(last_name_fragment)
  end

  def inspect
   "#<#{self.class} #{@customers.size} rows>"
   end

end
