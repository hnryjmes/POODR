# class Bicycle
#   attr_reader :size, :chain, :tire_size
#
#   def initialize(**opts)
#     @size = opts[:size]
#     @chain = opts[:chain] || default_chain
#     @tire_size = opts[:tire_size] || default_tire_size
#     post_initialize(opts)
#   end
#
#   def spares
#     { tire_size: tire_size,
#       chain: chain }.merge(local_spares)
#   end
#
#   def default_tire_size
#     raise NotImplementedError
#   end
#
#   # subclasses may override
#   def post_initialize(opts)
#   end
#
#   def local_spares
#     {}
#   end
#
#   def default_chain
#     "11-speed"
#   end
# end
#
# class RoadBike < Bicycle
#   attr_reader :tape_color
#
#   def post_initialize(opts)
#     @tape_color = opts[:tape_color]
#   end
#
#   def local_spares
#     { tape_color: tape_color }
#   end
#
#   def default_tire_size
#     "23"
#   end
# end
#
# class MountainBike < Bicycle
#   attr_reader :front_shock, :rear_shock
#
#   def post_initialize(opts)
#     @front_shock = opts[:front_shock]
#     @rear_shock = opts[:rear_shock]
#   end
#
#   def local_spares
#     { front_shock: front_shock }
#   end
#
#   def default_tire_size
#     "2.1"
#   end
# end
#
# class RecumbentBike < Bicycle
#   attr_reader :flag
#
#   def post_initialize(opts)
#     @flag = opts[:flag]
#   end
#
#   def local_spares
#     { flag: flag }
#   end
#
#   def default_chain
#     '10-speed'
#   end
#
#   def default_tire_size
#     '28'
#   end
# end
#
# road_bike =
#   RoadBike.new(
#     size: 'M',
#     tape_color: 'red')
#
# mountain_bike =
#   MountainBike.new(
#     size: 'S',
#     front_shock: 'Manitou',
#     rear_shock: 'Fox')
#
# bent =
#   RecumbentBike.new(
#     size: 'M',
#     flag: 'tall and orange')
#
# puts bent.spares

class Bicycle
  attr_reader :size, :parts

  def initialize(size:, parts:)
    @size = size
    @parts = parts
  end

  def spares
    parts.spares
  end
end
