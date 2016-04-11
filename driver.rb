require_relative 'rover'
class Driver
  def drive
    output = []
    while(input = gets.chomp) != 'exit'
      x_pos, y_pos, heading = input.split(" ")
      rover = Rover.new(x_pos.to_i, y_pos.to_i, heading)
      rover.navigate(gets.chomp)
      output << rover.final_position
    end
    output.each {|rover_final_position|
        puts "#{rover_final_position[:x]} #{rover_final_position[:y]} #{rover_final_position[:heading]} \n"
      }
  end
end

$upper_x_limit, $upper_y_limit = gets.chomp.split(" ")
driver = Driver.new
driver.drive
