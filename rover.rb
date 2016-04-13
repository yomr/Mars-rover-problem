class Rover
  attr_reader :x
  attr_reader :y
  attr_reader :heading

  def initialize(x_pos, y_pos, heading)
    @x = x_pos
    @y = y_pos
    @heading = heading
  end

  def set_environment(upper_x_limit, upper_y_limit)
    @upper_x_limit = upper_x_limit
    @upper_y_limit = upper_y_limit
    @lower_x_limit = 0
    @lower_y_limit = 0
  end


 
  def change_heading(next_direction)
    @heading = if next_direction == 'L'
                case @heading
                  when 'N' then 'W'
                  when 'W' then 'S'
                  when 'S' then 'E'
                  when 'E' then 'N'
                  else raise 'Invalid orientation_to_move_in'
                end
              elsif next_direction == 'R'
                case @heading
                  when 'N' then 'E'
                  when 'E' then 'S'
                  when 'S' then 'W'
                  when 'W' then 'N'
                  else raise 'Invalid orientation_to_move_in'
                end
              end
  end

  def move
    case @heading
      when 'N' 
        raise 'Moving out of the grid. Invalid co-oridnates. Exiting' if @y + 1 > @upper_y_limit.to_i
        @y = @y + 1
      when 'E' 
        raise 'Moving out of the grid. Invalid co-oridnates. Exiting' if @x + 1 > @upper_x_limit.to_i
        @x = @x + 1
      when 'S'
        raise 'Moving out of the grid. Invalid co-oridnates. Exiting' if @y - 1 < @lower_y_limit.to_i
        @y = @y - 1
      when 'W' 
        raise 'Moving out of the grid. Invalid co-oridnates. Exiting' if @x - 1 < @lower_x_limit.to_i
        @x = @x - 1
    end
  end
  
  #Instructions eg: LMLMLLMM
  def navigate(instructions)
    instructions.split("").each { |instruction| 
      if instruction == 'M'
        move
      else 
          change_heading(instruction)
      end
    }
    puts "#{@x} #{@y} #{@heading}"
  end
end
