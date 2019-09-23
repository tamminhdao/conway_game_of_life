class Runner
  attr_reader :io, :reading, :search_engine, :presenter, :validator, :menu

  def initialize(args)
    @io = args[:io]
    @reading = args[:reading]
    @search_engine = args[:search_engine]
    @presenter = args[:presenter]
    @validator = args[:validator]
    @menu = args[:menu]
  end

  def main_menu_loop
    answer = menu.main_menu_selection
    return if answer == '3'

    present_reading_list if answer == '1'
    seach_and_add_to_list if answer == '2'

    main_menu_loop
  end

  private

  def add_to_reading_list_loop(result)
    io.console_output('Would you like to add a book to your reading list?')
    response = menu.yes_no_selection
    return if menu.negative(response)

    reading.add(result[menu.book_selection.to_i - 1])
    present_reading_list

    add_to_reading_list_loop(result)
  end

  def present_reading_list
    io.console_output("You have #{reading.reading_list.length} book(s) in your reading list")
    io.console_output(presenter.present(reading.reading_list))
    io.console_output("\n")
  end

  def seach_and_add_to_list
    result = search_result
    io.console_output(presenter.present(result))
    io.console_output("\n")
    add_to_reading_list_loop(result)
  end

  def search_result
    io.console_output('Enter a book title or book author')
    keyword = io.user_input
    io.console_output("\nSearching...")
    search_engine.search(keyword)
  end
end
