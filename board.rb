require "./cell.rb"

class Board
  def initialize
    @cells = make_cells
  end

  def fill_cell(position, value)
    get_cell(position).value = value
  end

  def winning_cell?(position)
    cell = get_cell(position)
    diagonal_1_won = false
    if should_check_diagonal_1?(cell)
      diagonal_1_won = check_diagonal_1(cell)
    end
    diagonal_2_won = false
    if should_check_diagonal_2?(cell)
      diagonal_2_won = check_diagonal_2(cell)
    end
    check_row(cell) || check_column(cell) || diagonal_1_won || diagonal_2_won
  end

  def to_s
    result = ""
    for position in 1..9 do
      result += "#{get_cell(position)} "
      result += "\n" if (position % 3) == 0
    end
    result += "\n"
  end

  private

  # TODO: Remove
  def board
    cells
  end

  def cells
    @cells
  end

  def get_cell(position)
    cell = board[Cell.key_from_position(position)]
    raise ArgumentError, "invalid cell position" unless cell

    cell
  end

  def get_cell_from_coordinates(x, y)
    cell = board[Cell.key(x, y)]
    raise ArgumentError, "invalid cell coordinates" unless cell

    cell
  end

  def make_cells
    result = {}
    (1..9).each do |position|
      x = Cell.x_from_position(position)
      y = Cell.y_from_position(position)
      result[Cell.key(x, y)] = Cell.new(x, y, Cell.empty_value)
    end
    result
  end

  def check_row(cell)
    won = true
    (0..2).each do |x|
      next if x == cell.x

      checking_cell = get_cell_from_coordinates(x, cell.y)
      won = false if checking_cell.value != cell.value
    end
    won
  end

  def check_column(cell)
    won = true
    (0..2).each do |y|
      next if y == cell.y

      checking_cell = get_cell_from_coordinates(cell.x, y)
      won = false if checking_cell.value != cell.value
    end
    won
  end

  def should_check_diagonal_1?(cell)
    cell.x + cell.y == 2
  end

  def check_diagonal_1(cell)
    x = 0
    y = 2
    won = true
    3.times.each do
      next if x == cell.x && y == cell.y

      checking_cell = get_cell_from_coordinates(x, y)
      won = false if checking_cell.value != cell.value
      x += 1
      y -= 1
    end
    won
  end

  def should_check_diagonal_2?(cell)
    cell.x == cell.y
  end

  def check_diagonal_2(cell)
    won = true
    2.downto(0) do |i|
      next if i == cell.x

      checking_cell = get_cell_from_coordinates(i, i)
      won = false if checking_cell.value != cell.value
    end
    won
  end
end
