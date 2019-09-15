class Menu
  attr_reader :io_adapter

  def initialize(io_adapter)
    @io_adapter = io_adapter
  end

  def display(menu)
    io_adapter.console_output('Select from the options below:')
    menu.each do |index, option|
      io_adapter.console_output("#{index} - #{option}")
    end
  end

  def main_menu
    {
      '1': 'Search for books',
      '2': 'View my reading list',
      '3': 'Quit the program'
    }
  end
end
