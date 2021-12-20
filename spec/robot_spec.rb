require File.expand_path('robot')


RSpec.describe "Robot" do
  it "start of testing" do
    r = Robot.new
    t = r.add(3,4)
    expect(t).to eq([3,4,7])
    # expect("hello world").to start_with("hello")
  end
end
