require 'csv'


class Simulator

  def game(away,home,wins)
   winner = [away,home].sample
   wins[winner] += 1
  end

  def run(seasons = 1)
    wins = Hash.new(0)
    seasons.times do
      CSV.foreach("Fixtures1.csv", headers: true) do |row|
        away = row[0]
        home = row[1]
        game(away,home,wins)
      end
    end

    puts wins
  end

end


simulator = Simulator.new
simulator.run(1000)
