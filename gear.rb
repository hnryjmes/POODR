class Gear
  private
  attr_reader :chainring, :cog

  public
  def initialize(chainring, cog)
    @chainring = chainring
    @cog = cog
  end
end

class Blinkered
  def cog(gear)
    gear.cog
  end
end

puts Blinkered.new.cog(Gear.new(54, 11))
