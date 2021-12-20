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
    @isRobotReady = false
  end

  def PLACE(x =0, y =0, f=:NORTH)
    if f.class == String
      f = f.to_sym
    end
    if x >=0 && x < @dimX && y>=0 && y < @dimY
      @x= x
      @y= y
      @f= f
      @isRobotReady = true
    end
  end

  def MOVE()
    if @isRobotReady
      tempX = @x+ @@moveCode[@f][0]
      tempY = @y+ @@moveCode[@f][1]
      if tempX >=0 && tempX < @dimX && tempY>=0 && tempY < @dimY
        @x = tempX
        @y = tempY
      end
    end
  end

  def LEFT()
    if @isRobotReady
      newDirID = (@@directions.index(@f)-1) % @@directions.length
      @f = @@directions[newDirID]
    end

  end

  def RIGHT()
    if @isRobotReady
      newDirID = (@@directions.index(@f)+1) % @@directions.length
      @f = @@directions[newDirID]
    end

  end

  def REPORT()
    if @isRobotReady
      return @x,@y,@f.to_s
    end
  end

  def prepareCommand(command)
    # command = "r." + command.reverse.sub(",", ",:".reverse).reverse
    command = command.sub("NORTH",":NORTH").sub("EAST",":EAST").sub("SOUTH",":SOUTH").sub("WEST",":WEST")
    return command
  end

  def getFileName()
    puts "Hello Tomaj, I am the robot!\n Please create a file in inputs directory with '.inp' suffix. the file should containing robot commands.\n then enter the file name bellow."
    name = gets
    fileName = "inputs/"+name.split(".")[0].chop + '.inp'
    p fileName
    self.executer(fileName)
  end

  def executer(fileName)
    File.readlines(fileName).each do |command|
      if command.start_with?("PLACE")
        eval("self."+self.prepareCommand(command.chop))
      elsif command.start_with?("MOVE") || command.start_with?("LEFT") || command.start_with?("RIGHT")
        eval("self."+command.chop)
      elsif command.start_with?("REPORT")
        testResult =  eval("self."+command)
        puts testResult
      end
    end
  end
end
