class Menu
  attr_reader :io_adapter, :validator

  def initialize(io_adapter, validator)
    @io_adapter = io_adapter
    @validator = validator
  end

  def main_menu_selection
    display(main_menu)
    answer = io_adapter.user_input
    return if answer == '3'
    return answer if validator.validate(main_menu, answer)

    io_adapter.console_output("Invalid input. Try again. \n\n")
    main_menu_selection
  end

  def display(menu)
    io_adapter.console_output('Select from the options below:')
    menu.each do |index, option|
      io_adapter.console_output("#{index} - #{option}")
    end
  end

  def main_menu
    {
      '1' => 'Search for books',
      '2' => 'View my reading list',
      '3' => 'Quit the program'
    }
  end
end
