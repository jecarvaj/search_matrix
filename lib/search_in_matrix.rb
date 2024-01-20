# frozen_string_literal: true

# SearchInMatrix class is used to find a target in a matrix
# @matrix is a 2d array
# @target is the value to find
class SearchInMatrix
  attr_reader :path_steps

  def initialize(matrix, target)
    @matrix = matrix
    @target = target
    @row = 0
    @column = 1
    @path_steps = []
  end

  def invalid_matrix?
    return true unless @matrix.is_a?(Array)
    return true unless @matrix.all? { |row| row.is_a?(Array) }
    return true unless @matrix.all? { |row| row.length == @matrix[0].length }

    false
  end

  def exists_path?
    return true if find_target(@matrix, @target)

    false
  end

  private

  # rubocop:disable Metrics/MethodLength
  def find_target(matrix, target, row = @row, column = @column)
    return false if reached_limits?(row, column)

    if matrix[row][column] == target
      show_info(matrix)
      return true
    end

    right_cell = right_cell(matrix, row, column)
    down_cell = down_cell(matrix, row, column)

    if right_cell != 'X'
      mark_cell(matrix, row, column)
      search_right = find_target(matrix, target, row, column + 1)
    end

    if down_cell != 'X'
      mark_cell(matrix, row, column)
      search_down = find_target(matrix, target, row + 1, column)
    end

    search_right || search_down
  end
  # rubocop:enable Metrics/MethodLength

  def reached_limits?(row, column)
    max_height = @matrix.length - 1
    max_width = @matrix[0].length - 1

    row.negative? || column.negative? || row > max_height || column > max_width
  end

  def right_cell(matrix, row, column)
    column + 1 < matrix[0].length ? matrix[row][column + 1] : 'X'
  end

  def down_cell(matrix, row, column)
    row + 1 < matrix.length ? matrix[row + 1][column] : 'X'
  end

  def mark_cell(matrix, row, column)
    path_steps.push([row, column])
    matrix[row][column] = 'o' unless matrix[row][column] == 'S'
  end

  def show_info(matrix)
    puts 'Se ha encontrado el camino'
    print_matrix(matrix)
    puts 'Pasos:'
    print_steps
  end

  def print_matrix(matrix)
    line_length = matrix[0].length * 4 + 1
    line = '-' * line_length

    puts line
    matrix.each do |row|
      puts "| #{row.join(' | ')} |"
      puts line
    end
  end

  def print_steps
    path_steps.each do |step|
      print "[#{step[0]}, #{step[1]}] "
    end
    puts
  end
end
