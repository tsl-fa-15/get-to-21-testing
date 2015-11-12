require 'rails_helper'

RSpec.describe Game, type: :model do
  context '#new_amount' do
    it 'properly adds numbers' do
      game = Game.new(5,3)
      expect(game.new_amount).to eq(8)
    end
  end

  context '#result' do
    it 'returns "win" if new amount is 21' do
      game = Game.new(18,3)
      expect(game.result).to eq('win')
    end

    it 'returns "over" if new amount is over 21' do
      game = Game.new(19,3)
      expect(game.result).to eq('over')
    end

    it 'returns "ongoing" if new amount is over 21' do
      game = Game.new(4,3)
      expect(game.result).to eq('ongoing')
    end
  end

  context '#main_text' do
    it  'returns "Get to 21!" if game is ongoing' do
      game = Game.new(4,3)
      expect(game.main_text).to eq("Get to 21!")
    end

    it  'returns "You won!" if player won' do
      game = Game.new(18,3)
      expect(game.main_text).to eq("You won!")
    end

    it  'returns "You should have won, but you went over..." if player goes over 21' do
      game = Game.new(19,3)
      expect(game.main_text).to eq("You should have won, but you went over...")
    end
  end
end
