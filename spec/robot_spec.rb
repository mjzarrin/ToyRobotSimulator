require File.expand_path('robot')

RSpec.describe "Robot" do
  testCases = Dir["testCases/*.testCase"]

  testCases.each { |testCase|
    puts testCase
    it "start of testing" + testCase  do
      r = Robot.new
      finished = false
      testResult = "-"
      desiredResult = "+"
      File.readlines(testCase).each do |command|
        if finished
          command = "[" + r.prepareCommand(command) + "]"
          desiredResult = eval(command)
          desiredResult[-1] = desiredResult[-1].to_s
          break
        end
        if command.start_with?("PLACE")
          eval("r."+r.prepareCommand(command.chop))
        elsif command.start_with?("MOVE") || command.start_with?("LEFT") || command.start_with?("RIGHT")
          eval("r."+command.chop)
        elsif command.start_with?("REPORT")
          testResult =  eval("r."+command.chop)
          finished = true
        end
      end
      expect(testResult).to eq(desiredResult)
    end
  }
end
