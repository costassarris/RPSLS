class Game

  attr_accessor :winner

  def compare(player, computer)
    @winner= :draw if player.choice == computer.choice
    if player.choice == "rock"
      @winner=computer if computer.choice == "paper" || computer.choice == "spock"
      @winner=player if computer.choice == "scissors" || computer.choice == "lizard"
    elsif player.choice == "paper"
      @winner=player if computer.choice == "rock" || computer.choice == "spock"
      @winner=computer if computer.choice == "scissors" || computer.choice == "lizard"
    elsif player.choice == "scissors"
      @winner=player if computer.choice == "paper" || computer.choice == "lizard"
      @winner=computer if computer.choice == "rock" || computer.choice == "spock"
    elsif player.choice == "lizard"
      @winner=player if computer.choice == "paper" || computer.choice == "spock"
      @winner=computer if computer.choice == "rock" || computer.choice == "scissors"
    elsif player.choice == "spock"
      @winner=computer if computer.choice == "paper" || computer.choice == "lizard"
      @winner=player if computer.choice == "rock" || computer.choice == "scissors"
    else
      raise "Could not compare moves"
    end
  end

end