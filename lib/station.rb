class Station

  attr_reader :name, :zone

<<<<<<< HEAD
 def initialize(name, zone = rand(8))
   @name = name
   @zone = zone
 end
=======
  def initialize(name, zone)
    @name = name
    @zone = zone
  end
>>>>>>> 6e9139ae376044018cbfebde7d3ba41170606e9d

end
