class Game
  attr_accessor :current_amount, :increment

  def initialize(current_amount, increment)
    @current_amount = current_amount.to_i
    @increment = increment.to_i
  end

  def new_amount
    current_amount + increment
  end

  def result
    if new_amount > 21
      return 'over'
    elsif new_amount == 21
      return 'win'
    else
      return 'ongoing'
    end
  end

  def main_text
    if result == 'ongoing'
      return "Get to 21!"
    elsif result == 'win'
      return 'You won!'
    elsif result == 'over'
      return 'You should have won, but you went over...'
    end
  end

end
