require 'pry'

class BoardCase
  attr_accessor :value, :case_id

  
  def initialize(case_id)
    @case_id = case_id
    @value = " "
  end
end

# binding.pry