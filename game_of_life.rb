class GameOfLife
  def get_next_grid(current_grid)
    new_grid = current_grid

    new_grid.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|
        living_neighbours_count = number_of_living_neighbours(row_index, column_index, new_grid)
        new_state_of_cell(cell, living_neighbours_count)
      end
    end
  end

  def new_state_of_cell(cell, living_neighbours_count)
    if cell == :live && living_neighbours_count < 2
      cell = :dead
    elsif cell == :live && living_neighbours_count > 3
      cell = :dead
    elsif cell == :live && living_neighbours_count == 2
      cell = :live 
    elsif cell == :live && living_neighbours_count == 3
      cell == :live
    elsif cell == :dead && living_neighbours_count == 3
      cell = :live
    else 
      cell = :dead
    end 
  end

  def number_of_living_neighbours(cell_row, cell_column, grid)
    living_neighbours = 0
    if grid[cell_row+1] != nil
      if grid[cell_row+1][cell_column] == :live
        living_neighbours += 1
      end
    end

    if grid[cell_row-1] != nil 
      if grid[cell_row-1][cell_column] == :live
        living_neighbours += 1
      end
    end

    if grid[0][cell_column+1] != nil
      if grid[cell_row][cell_column+1] == :live
        living_neighbours += 1
      end
    end

    if grid[0][cell_column-1] != nil
      if grid[cell_row][cell_column-1] == :live
        living_neighbours += 1
      end
    end

    if grid[cell_row-1] != nil && grid[0][cell_column+1] != nil
      if grid[cell_row-1][cell_column+1] == :live
        living_neighbours += 1
      end
    end

    if grid[cell_row+1] != nil && grid[0][cell_column-1] != nil
      if grid[cell_row+1][cell_column-1] == :live
        living_neighbours += 1
      end
    end

    if grid[cell_row-1] != nil && grid[0][cell_column-1] != nil
      if grid[cell_row-1][cell_column-1] == :live
        living_neighbours += 1
      end
    end

    if grid[cell_row+1] != nil && grid[0][cell_column+1] != nil
      if grid[cell_row+1][cell_column+1] == :live
        living_neighbours += 1
      end
    end

    return living_neighbours
  end
end


