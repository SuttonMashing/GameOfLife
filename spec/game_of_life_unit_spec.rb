describe GameOfLife do
  context '#new_state_of_cell' do
    context 'when cell is dead' do
      it 'stays dead if its neighbours are all dead' do
        initial_state = :dead
        living_neighbours_count = 0

        new_state = subject.new_state_of_cell(initial_state, living_neighbours_count)

        expect(new_state).to eq(:dead)
      end
    end
  end

  context '#number_of_living_neighbours' do
    it 'returns 0 given the middle cell in a dead grid' do
      target_cell = :dead

      dead_cells = [
        [:dead, :dead,        :dead],
        [:dead, :target_cell, :dead],
        [:dead, :dead,        :dead]
      ]

      cell_row = 1
      cell_column = 1

      expect(
        subject.number_of_living_neighbours(cell_row, cell_column, dead_cells)
      ).to eq(0)
    end

    it 'alive neighbour horizontally right' do

      target_cell = :live

      grid_one_neighbour_alive = [
        [:dead, :dead,        :dead],
        [:dead, :target_cell, :live],
        [:dead, :dead,        :dead]
      ]

      cell_row = 1
      cell_column = 1

      expect(
        subject.number_of_living_neighbours(cell_row, cell_column, grid_one_neighbour_alive)
      ).to eq(1)
    end      

    it 'alive neighbour horizontally left' do

      target_cell = :live

      grid_one_neighbour_alive = [
        [:dead, :dead,        :dead],
        [:dead, :live,        :target_cell],
        [:dead, :dead,        :dead]
      ]

      cell_row = 1
      cell_column = 2

      expect(
        subject.number_of_living_neighbours(cell_row, cell_column, grid_one_neighbour_alive)
      ).to eq(1)
    end
    
    it 'alive neighbour vertically above' do

      target_cell = :live

      grid_one_neighbour_alive = [
        [:dead, :dead,        :live],
        [:dead, :dead,        :target_cell],
        [:dead, :dead,        :dead]
      ]

      cell_row = 1
      cell_column = 2

      expect(
        subject.number_of_living_neighbours(cell_row, cell_column, grid_one_neighbour_alive)
      ).to eq(1)
    end 

    it 'alive neighbour vertically below' do

      target_cell = :live

      grid_one_neighbour_alive = [
        [:dead, :dead,        :dead],
        [:dead, :dead,        :target_cell],
        [:dead, :dead,        :live]
      ]

      cell_row = 1
      cell_column = 2

      expect(
        subject.number_of_living_neighbours(cell_row, cell_column, grid_one_neighbour_alive)
      ).to eq(1)
    end 

    it "alive neighbour diagonally above right" do

      target_cell = :live

      grid_one_neighbour_alive = [
        [:dead, :dead,        :live],
        [:dead, :target_cell, :dead],
        [:dead, :dead,        :dead]
      ]

      cell_row = 1
      cell_column = 1

      expect(
        subject.number_of_living_neighbours(cell_row, cell_column, grid_one_neighbour_alive)
      ).to eq(1)
    end 

    it "alive neighbour diagonally below left" do

      target_cell = :live

      grid_one_neighbour_alive = [
        [:dead, :dead,        :dead],
        [:dead, :target_cell, :dead],
        [:live, :dead,        :dead]
      ]

      cell_row = 1
      cell_column = 1

      expect(
        subject.number_of_living_neighbours(cell_row, cell_column, grid_one_neighbour_alive)
      ).to eq(1)
    end 

    it "alive neighbour diagonally above left" do

      target_cell = :live

      grid_one_neighbour_alive = [
        [:live, :dead,        :dead],
        [:dead, :target_cell, :dead],
        [:dead, :dead,        :dead]
      ]

      cell_row = 1
      cell_column = 1

      expect(
        subject.number_of_living_neighbours(cell_row, cell_column, grid_one_neighbour_alive)
      ).to eq(1)
    end 

    it "alive neighbour diagonally below right" do

      target_cell = :live

      grid_one_neighbour_alive = [
        [:dead, :dead,        :dead],
        [:dead, :target_cell, :dead],
        [:dead, :dead,        :live]
      ]

      cell_row = 1
      cell_column = 1

      expect(
        subject.number_of_living_neighbours(cell_row, cell_column, grid_one_neighbour_alive)
      ).to eq(1)
    end 

     it "can cope when target cell is on bottom row" do

      target_cell = :live

      grid_one_neighbour_alive = [
        [:dead, :dead,        :dead],
        [:dead, :dead,        :dead],
        [:dead, :target_cell, :live]
      ]

      cell_row = 2
      cell_column = 1

      expect(
        subject.number_of_living_neighbours(cell_row, cell_column, grid_one_neighbour_alive)
      ).to eq(1)
    end 

  end
end