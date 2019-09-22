class Validation
  def validate(menu, user_input)
    menu.key?(user_input)
  end

  def validate_book_selection(user_input)
    one_to_ten(user_input)
  end

  private

  def one_to_ten(user_input)
    user_input.to_i.positive? && user_input.to_i <= 10
  end
end
