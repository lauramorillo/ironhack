class Car
  def initialize(sound, engine)
    @sound = sound
    @engine = engine
  end

  def sound
    puts @sound
    @engine.sound
  end
end

class Engine
  def initialize(sound)
    @sound = sound
  end

  def sound
    puts @sound
  end

end

class ElectricEngine < Engine
  def initialize
    super('shhhhhh')
  end
end

class GasoilEngine < Engine
  def initialize
    super('BRRRRRR')
  end
end

electric_engine = Engine.new("shhhhh) #ElectricEngine.new
puts "Electric car sound: "
Car.new("BRROOOOMMMM", electric_engine).sound
puts "Gasoil car sound: "
Car.new("BRROOOOMMMM", GasoilEngine.new).sound
my_new_car = Car.new("LALALA", ElectricEngine.new)