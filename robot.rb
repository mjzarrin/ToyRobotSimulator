class Robot
  @@directions = [:NORTH,:EAST,:SOUTH,:WEST]
  @@moveCode = {
    :NORTH => [0,+1],
    :EAST => [+1,0],
    :SOUTH => [0,-1],
    :WEST => [-1,0]

  }
  def initialize(dimX=5, dimY=5)
    @dimX = dimX
    @dimY = dimY
  end

  def PLACE(x =0, y =0, f=:NORTH)
    if f.class == String
      f = f.to_sym
    end
    @x= x
    @y= y
    @f= f
  end

  def MOVE()
    tempX = @x+ @@moveCode[@f][0]
    tempY = @y+ @@moveCode[@f][1]
    if tempX >=0 && tempX < @dimX && tempY>=0 && tempY < @dimY
      @x = tempX
      @y = tempY
    end
  end

  def LEFT()
    newDirID = (@@directions.index(@f)-1) % @@directions.length
    @f = @@directions[newDirID]
  end

  def RIGHT()
    newDirID = (@@directions.index(@f)+1) % @@directions.length
    @f = @@directions[newDirID]
  end

  def REPORT()
    return @x,@y,@f.to_s
  end

  def prepareCommand(command)
    # command = "r." + command.reverse.sub(",", ",:".reverse).reverse
    command = command.sub("NORTH",":NORTH").sub("EAST",":EAST").sub("SOUTH",":SOUTH").sub("WEST",":WEST")
    return command
  end

end

# r= Robot.new()
# r.PLACE(1,2,'EAST')
# # eval("r."+r.prepareCommand("PLACE 1,2,EAST"))
# r.MOVE
# r.MOVE
# r.LEFT
# r.MOVE
# p r.REPORT()
