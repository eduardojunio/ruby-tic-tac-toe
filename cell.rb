class Cell
  def self.x_from_position(position)
    (position - 1) % 3
  end

  def self.y_from_position(position)
    y = nil
    case position
    when 1..3
      y = 0
    when 4..6
      y = 1
    when 7..9
      y = 2
    end
    y
  end

  def self.key(x, y)
    "(#{x}, #{y})"
  end

  def self.key_from_position(position)
    x = Cell.x_from_position(position)
    y = Cell.y_from_position(position)
    Cell.key(x, y)
  end

  def self.valid_values
    ["X", "O", Cell.empty_value]
  end

  def self.empty_value
    nil
  end

  attr_reader :x, :y, :value

  def initialize(x, y, value)
    self.x = x
    self.y = y
    # Required because we can't assign a value for an already filled cell
    # Otherwise initialization would fail because value wouldn't be set to empty value
    @value = Cell.empty_value
    self.value = value
  end

  def x=(new_x)
    raise ArgumentError, invalid_coordinate_message("x", new_x) unless valid_coordinate?(new_x)

    @x = new_x
  end

  def y=(new_y)
    raise ArgumentError, invalid_coordinate_message("y", new_y) unless valid_coordinate?(new_y)

    @y = new_y
  end

  def value=(new_value)
    raise ArgumentError, invalid_value_message(new_value) unless valid_value?(new_value)

    raise ArgumentError, already_filled_message if filled?

    @value = new_value
  end

  def to_s
    value == Cell.empty_value ? "_" : value
  end

  private

  def filled?
    value != Cell.empty_value
  end

  def already_filled_message
    "Cannot set the value of an already filled cell."
  end

  def valid_coordinate?(coordinate)
    coordinate >= 0 && coordinate <= 2
  end

  def invalid_coordinate_message(coordinate, value)
    "Invalid #{coordinate}: \"#{value}\". Must be between 0 and 2."
  end

  def valid_value?(value)
    Cell.valid_values.include?(value)
  end

  def valid_values_message
    Cell.valid_values.map { |v| v ? "\"#{v}\"" : v.inspect }.join(", ")
  end

  def invalid_value_message(value)
    "Invalid value: \"#{value}\". Must be one of: #{valid_values_message}"
  end
end
