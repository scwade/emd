class MyrecordController < ApplicationController
  def index
    @conditions = Condition.find_my_conditions
  end

end
