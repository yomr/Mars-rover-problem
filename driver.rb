require_relative 'rover'
class Driver
  def drive
    upper_x_limit, upper_y_limit = gets.chomp.split(" ")
    while(input = gets.chomp.strip) != ''
      x_pos, y_pos, heading = input.split(" ")
      if x_pos > upper_x_limit || y_pos > upper_y_limit || x_pos < 0 || y_pos < 0
        puts "Invalid starting pos: pos should be between 0, 0, #{upper_x_limit}, #{upper_y_limit}"
      exit
      end
      rover = Rover.new(x_pos.to_i, y_pos.to_i, heading)
      rover.set_environment(upper_x_limit, upper_y_limit)
      rover.navigate(gets.chomp)
    end
  end
end

driver = Driver.new
driver.drive
