module SomeFramework
  class Gear
    attr_reader :chainring, :cog, :wheel
    def initialize(chainring, cog, wheel)
      @chainring = chainring
      @cog = cog
      @wheel = wheel
    end

    def default_chainring
      (100/2) - 10 # silly code, useful example
    end

    def gear_inches
      ratio * wheel.diameter
    end

    def ratio
      chainring / cog.to_f
    end

  # ...
  end
end

# wrap the interface to protect yourself from changes
module GearWrapper
  def self.gear(chainring:, cog:, wheel:)
    SomeFramework::Gear.new(chainring, cog, wheel)
  end
end

class Wheel
  attr_reader :rim, :tire
  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end
# ...
end

puts GearWrapper.gear(
  chainring: 52,
  cog: 11,
  wheel: Wheel.new(26, 1.5)).gear_inches
