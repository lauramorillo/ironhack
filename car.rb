class Car
  def initialize
    @cities = []
    @brand = "Toyota"
  end

  def cities
    puts @cities
  end

  def add_city(city)
    @cities << city
  end
end

class RaceCar < Car
  def initialize(team)
    super()
    @team = team
    @team_members = []
    @brand = "Volkswagen"
  end

  def team_members
    puts "The team members from #{@team} are: #{@team_members}"
  end

  def add_team_member(name)
    @team_members << name
  end

  def read_brand
    puts @brand
  end
end

ferrari = RaceCar.new("Ferrari")
ferrari.add_team_member("Laura")
ferrari.team_members
ferrari.add_city("Madrid")
ferrari.cities
ferrari.read_brand
