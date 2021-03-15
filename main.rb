class Wisielec
  def initialize
    @word = words.sample
    @chances = 5
    @word_blank = ""
    @word.first.size.times do
      @word_blank += "_ "
      end

  end
  def words
    [
      ["kontynent","Geografia"],
      ["terrorysta","Zawód"],
      ["onomatopeja","Środki stylistyczne"],
      ["gitara","Instrumenty muzyczne"],
      ["serce","Organy wewnętrzne"],
      ["zupa","Dania"]
    ]
  end
  def word_blank last_guess = nil
    blank_update(last_guess) unless last_guess.nil?
    puts @word_blank
end
  def blank_update last_guess
    new_space = @word_blank.split
    new_space.each_with_index do |letter, index|

      if letter == '_' && @word.first[index] == last_guess
        new_space[index] = last_guess

      end
    end

    @word_blank = new_space.join(' ')
  end
  def begin
    puts "Nowa gra, twoja kategoria to: #{@word.last}"
    puts "Twoje słowo ma #{@word.first.size} liter"
    word_blank
    guessing
  end
  def guessing
    if @chances > 0
      puts "Wprowadź literę:"
      guess = gets.chomp
      correct = @word.first.include? guess
      if correct
        puts "Prawidłowa litera"

        word_blank guess
        if  @word.first == @word_blank.split.join
          puts "Gratulacje, wygrałeś!"
          else
        guessing
        end
      else
        @chances -=1
        puts "Zła litera, zostało ci : #{@chances} szans. Spróbuj ponownie"
        guessing
    end
    else
      puts "Przegrałeś"
    end
    end


end
game = Wisielec.new
game.begin