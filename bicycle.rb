class Bicycle
  attr_reader :size

  def initialize(**opts)
    @size = opts[:size]
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color

  def initialize(**opts)
    @tape_color = opts[:tape_color]
    super
  end

end
