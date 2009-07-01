class Record
  attr_reader :items
  
  def initialize
    @items = []
  end

  def total_quantity
    @items.sum { |item| item.quantity }
  end


  def add_condition(condition)
#    @items << condition
   current_item = @items.find {|item| item.condition == condition}
    if current_item
      current_item.increment_quantity
    else
    @items << RecordItem.new(condition)
    end
  end
end

