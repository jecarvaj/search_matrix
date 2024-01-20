# frozen_string_literal: true

require_relative 'lib/search_in_matrix'

# Matrix 1, path exists
# matrix = [
#   ['S', ' ', 'X', ' ', ' ', ' '],
#   [' ', ' ', 'X', ' ', 'X', ' '],
#   ['X', ' ', 'X', ' ', 'X', ' '],
#   ['X', ' ', ' ', ' ', ' ', ' '],
#   ['X', 'X', 'X', 'X', 'X', ' '],
#   [' ', ' ', ' ', ' ', ' ', 'E']
# ]

# uncomment to prove other matrix
# # Matrix 2, path exists
# matrix = [
#   ['S', ' ', ' ', ' ', ' ', ' '],
#   ['X', 'X', 'X', ' ', 'X', ' '],
#   [' ', ' ', ' ', ' ', 'X', ' '],
#   [' ', 'X', 'X', 'X', 'X', ' '],
#   [' ', ' ', ' ', ' ', ' ', 'E']
# ]
# # Matrix 3, path does exists
# matrix = [
#   ['S', ' ', 'X'],
#   ['X', ' ', 'X'],
#   ['X', ' ', 'E']
# ]

# # Matrix 4, path does not exists
# matrix = [
#   ['S', ' ', 'X', 'X', ' ', ' '],
#   [' ', 'X', ' ', 'X', ' ', 'X'],
#   [' ', 'X', ' ', ' ', ' ', 'X'],
#   [' ', ' ', 'X', 'X', 'X', ' '],
#   ['X', ' ', ' ', ' ', 'X', 'E']
# ]
#
# # Matrix 5, invalid matrix
# matrix = [
#   [1, 2, 3],
#   [2, 1],
#   '1'
# ]

target = 'E'
matrix_search = SearchInMatrix.new(matrix, target)

if matrix_search.invalid_matrix?
  puts 'La matriz no es valida'
  return
end

exists = matrix_search.exists_path?
puts 'No existe un camino' unless exists
