##
# Recursive Flood Fill
#
# Usage:  ruby flood-fill-recursive.rb {input_filename} {x_coord} {y_coord} {replace_with}

#Simple file reading
def read_grid(filename)
  grid = []
  File.open(filename, 'r').each do |line|
    grid.push line
  end
  grid
end

#Prime the recursive call with the original color at (x,y) so the caller doesn't need to know it
def flood_fill(grid, x, y, new_color)
  old_color = grid[x][y]
  #Will Stack overflow if the colors are the same
  if old_color != new_color
    do_flood_fill(grid, x, y, grid[x][y], new_color)
  else
    grid
  end
end

def do_flood_fill(grid, x, y, old_color, new_color)
  if grid[x][y] == old_color
    grid[x][y] = new_color
    do_flood_fill grid, x-1, y, old_color, new_color if (x-1) >= 0
    do_flood_fill grid, x+1, y, old_color, new_color if (x+1) < grid.length
    do_flood_fill grid, x, y-1, old_color, new_color if (y-1) >= 0
    do_flood_fill grid, x, y+1, old_color, new_color if (y+1) < grid[x].length
  end
  grid
end

grid = read_grid ARGV[0]
puts flood_fill grid, ARGV[2].to_i, ARGV[1].to_i, ARGV[3]
