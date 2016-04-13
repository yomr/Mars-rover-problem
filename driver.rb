require_relative 'rover'
class Driver
  def drive
    upper_x_limit, upper_y_limit = gets.chomp.split(" ")
    while(input = gets.chomp.strip) != ''
      x_pos, y_pos, heading = input.split(" ")
      rover = Rover.new(x_pos.to_i, y_pos.to_i, heading)
      rover.set_environment(upper_x_limit, upper_y_limit)
      rover.navigate(gets.chomp)
    end
  end
end

driver = Driver.new
driver.drive
