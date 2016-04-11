class Rover
  attr_reader :final_position
  attr_accessor :current_position
  attr_accessor :orientation_to_move_in

  def initialize(x_pos, y_pos, heading)
    @current_position = {x: x_pos, y: y_pos, heading: heading}
    @orientation_to_move_in = heading
  end

  def update_orientation_to_move_in(next_direction)
    if next_direction == 'L'
      case @orientation_to_move_in
        when 'N' then 'W'
        when 'W' then 'S'
        when 'S' then 'E'
        when 'E' then 'N'
        else raise 'Invalid orientation_to_move_in'
      end
    elsif next_direction == 'R'
      case @orientation_to_move_in
        when 'N' then 'E'
        when 'E' then 'S'
        when 'S' then 'W'
        when 'W' then 'N'
        else raise 'Invalid orientation_to_move_in'
      end
    end
  end
 
  def change_orientation(next_direction)
      @orientation_to_move_in = update_orientation_to_move_in(next_direction)
  end

  def move
    current_x = @current_position[:x]
    current_y = @current_position[:y]    
    case @orientation_to_move_in
      when 'N' 
        raise 'Moving out of the grid. Invalid co-oridnates. Exiting' if current_y + 1 > $upper_y_limit.to_i
        @current_position = {x: current_x, y: current_y + 1, heading: @orientation_to_move_in}
      when 'E' 
        raise 'Moving out of the grid. Invalid co-oridnates. Exiting' if current_x + 1 > $upper_x_limit.to_i
        @current_position = {x: current_x + 1, y: current_y, heading: @orientation_to_move_in}
      when 'S' 
        raise 'Moving out of the grid. Invalid co-oridnates. Exiting' if current_y - 1 < $lower_y_limit.to_i
        @current_position = {x: current_x, y: current_y - 1, heading: @orientation_to_move_in}
      when 'W' 
        raise 'Moving out of the grid. Invalid co-oridnates. Exiting' if current_x - 1 < $lower_x_limit.to_i
        @current_position = {x: current_x - 1, y: current_y, heading: @orientation_to_move_in}
    end
  end
  
  #Instructions eg: LMLMLLMM
  def navigate(instructions)
    instructions.split("").each { |instruction| 
      if instruction == 'M'
        move
      else 
          change_orientation(instruction)
      end
    }
    @final_position = @current_position
    @final_position
  end
end
