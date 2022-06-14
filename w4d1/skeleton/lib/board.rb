class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    @cups.each_with_index do |ele, idx|
      if idx != 6 && idx != 13
        @cups[idx] = [:stone, :stone, :stone, :stone]
      end
    end
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if start_pos > 12 || start_pos < 0
      raise "Invalid starting cup"
    end
    if @cups[start_pos] == []
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    stones_in_hand = @cups[start_pos]
    @cups[start_pos] = []
    x = start_pos
    while stones_in_hand.length != 0
      x += 1
      if current_player_name == @player1 && x != 13
        @cups[x] << stones_in_hand.shift
      end
      if current_player_name == @player2 && x != 6
        @cups[x] << stones_in_hand.shift
      end
      if x == 13 && stones_in_hand.length != 0
        x = -1
      end
    end
    render
    next_turn(x)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    end
    if @cups[ending_cup_idx].length == 1
      return :switch
    end
    ending_cup_idx
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    x = 0
    while x != 13
      if @cups[x] != []
        return false
      end
      if x == 6
        return true
      end
      x += 1
    end

  end

  def winner
    if @cups[6] == @cups[13]
      return :draw
    end
    if @cups[6].length > @cups[13].length
      return @player1
    else
      return @player2
    end
  end
end
