class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []

  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game

  end

  def take_turn
    show_sequence
    require_sequence
    if @game_over == false
      self.round_success_message
      @sequence_length += 1
    end

  end

  def show_sequence
    add_random_color
    @seq.each do |ele|
      puts ele
      sleep 0.75
      system("clear")
      sleep 0.25
    end
  end

  def require_sequence
    "Enter the sequence you just saw"
    @seq.each do |ele|
      user_input = gets.chomp
      if user_input != ele
        game_over = true
        break
      end
    end
    sleep 0.25

  end

  def add_random_color
    @seq << COLORS.shuffle[0]
  end

  def round_success_message
    puts "Round Success!"

  end

  def game_over_message
    puts "You Lose!"

  end

  def reset_game
    @seq = []
    @game_over = false
    @sequence_length = 1
  end
end
