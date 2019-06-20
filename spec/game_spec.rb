require_relative '../lib/game'

describe Game do
  describe '#add' do
    it 'can do math' do
      game = Game.new
      expect(game.add(1,1)).to eq(2)
    end
  end
end
