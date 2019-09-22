require 'spec_helper'

describe Menu do
  describe '#display' do
    it 'displays the main menu' do
      mock_io_adapter = IOadapter.new(StringIO.new, StringIO.new)
      validation = Validation.new
      menu = Menu.new(mock_io_adapter, validation)

      menu.display(menu.main_menu)
      output_stream = mock_io_adapter.output.string

      expect(output_stream).to include('Select from the options below:')
      expect(output_stream).to include('1 - Search for books')
      expect(output_stream).to include('2 - View my reading list')
      expect(output_stream).to include('3 - Quit the program')
    end
  end
end
