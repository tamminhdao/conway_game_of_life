class Menu
  attr_reader :io_adapter, :validator

  def initialize(io_adapter, validator)
    @io_adapter = io_adapter
    @validator = validator
  end

  def book_selection
    io_adapter.console_output('Pick you book based on the order of your search result')
    answer = io_adapter.user_input
    return answer if validator.validate_book_selection(answer)

    io_adapter.console_output("Invalid input. Try again. \n\n")
    book_selection
  end

  def yes_no_selection
    io_adapter.console_output('Please type [Y]es or [N]o.')
    answer = io_adapter.user_input
    return answer if validator.validate(yes_no_menu, answer)

    io_adapter.console_output("Invalid input. Try again. \n\n")
    yes_no_selection
  end

  def main_menu_selection
    display(main_menu)
    answer = io_adapter.user_input
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

  def negative(response)
    yes_no_menu[response] == 'negative'
  end

  private

  def main_menu
    {
      '1' => 'View my reading list',
      '2' => 'Search for books',
      '3' => 'Quit the program'
    }
  end

  def yes_no_menu
    {
      'Y' => 'affirmative',
      'y' => 'affirmative',
      'yes' => 'affirmative',
      'Yes' => 'affirmative',
      'n' => 'negative',
      'N' => 'negative',
      'No' => 'negative',
      'no' => 'negative'
    }
  end
end
