class Merchant
  attr_reader :id, :name

  def initialize(name_id)
    @id = name_id[:id]
    @name = name_id[:name]
  end

end