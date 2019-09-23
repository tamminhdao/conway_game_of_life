require 'spec_helper'

describe Menu do
  describe '#display' do
    it 'displays the main menu' do
      mock_io_adapter = IOadapter.new(StringIO.new, StringIO.new)
      validation = Validation.new
      menu = Menu.new(mock_io_adapter, validation)
      selection = { '1' => 'View my reading list',
                    '2' => 'Search for books',
                    '3' => 'Quit the program' }

      menu.display(selection)
      output_stream = mock_io_adapter.output.string

      expect(output_stream).to include('Select from the options below:')
      expect(output_stream).to include('1 - View my reading list')
      expect(output_stream).to include('2 - Search for books')
      expect(output_stream).to include('3 - Quit the program')
    end
  end

  describe '#book_selection' do
    it 'returns the user input when validation passed' do
      input = StringIO.new('10')
      mock_io_adapter = IOadapter.new(input, StringIO.new)
      validation = Validation.new
      menu = Menu.new(mock_io_adapter, validation)

      expect(menu.book_selection).to eq('10')
    end

    it 'outputs an error when validation failed' do
      input = StringIO.new("15\n3\n")
      mock_io_adapter = IOadapter.new(input, StringIO.new)
      validation = Validation.new
      menu = Menu.new(mock_io_adapter, validation)
      output_stream = mock_io_adapter.output.string

      menu.book_selection

      expect(output_stream).to include("Invalid input. Try again. \n\n")
    end
  end

  describe '#yes_no_selection' do
    it 'returns the user input when validation passed' do
      input = StringIO.new('Y')
      mock_io_adapter = IOadapter.new(input, StringIO.new)
      validation = Validation.new
      menu = Menu.new(mock_io_adapter, validation)

      expect(menu.yes_no_selection).to eq('Y')
    end

    it 'outputs an error when validation failed and present the choices again' do
      input = StringIO.new("OK\nYes\n")
      mock_io_adapter = IOadapter.new(input, StringIO.new)
      validation = Validation.new
      menu = Menu.new(mock_io_adapter, validation)
      output_stream = mock_io_adapter.output.string

      menu.yes_no_selection

      expect(output_stream).to include("Invalid input. Try again. \n\n")
      expect(output_stream).to include('Please type [Y]es or [N]o.')
    end
  end

  describe '#main_menu_selection' do
    it 'returns the user input when validation passed' do
      input = StringIO.new('1')
      mock_io_adapter = IOadapter.new(input, StringIO.new)
      validation = Validation.new
      menu = Menu.new(mock_io_adapter, validation)

      expect(menu.main_menu_selection).to eq('1')
    end

    it 'outputs an error when validation failed and present the menu again' do
      input = StringIO.new("5\n3\n")
      mock_io_adapter = IOadapter.new(input, StringIO.new)
      validation = Validation.new
      menu = Menu.new(mock_io_adapter, validation)
      output_stream = mock_io_adapter.output.string

      menu.main_menu_selection

      expect(output_stream).to include("Invalid input. Try again. \n\n")
      expect(output_stream).to include('Select from the options below:')
      expect(output_stream).to include('1 - View my reading list')
      expect(output_stream).to include('2 - Search for books')
      expect(output_stream).to include('3 - Quit the program')
    end
  end
end
