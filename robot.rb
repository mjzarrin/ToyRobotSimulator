=begin
Toy Robot Simulator

Requirements:
  5 units x 5 units
  no other obstructions
  free to roam around
  prevented from falling by skiping the MOVE or raise an exception for the Place

Commands:
  PLACE X Y F
  MOVE
  LEFT
  RIGHT
  REPORT

Input:
  Either from file or standard input
=end


def clap_hands(number)
  puts "Clap " * number
end

clap_hands(3)
