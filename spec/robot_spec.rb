require File.expand_path('robot')

RSpec.describe "Robot" do
  testCases = Dir["testCases/*.testCase"]

  testCases.each { |testCase|
    puts testCase
    it "start of testing" + testCase  do
      r = Robot.new
      t = r.add(3,4)
      expect(t).to eq([3,4,7])
      File.readlines(testCase).each do |command|
        puts command.chop
      end
    end
  }
end
