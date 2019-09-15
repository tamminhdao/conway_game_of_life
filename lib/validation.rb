class Validation
  def validate(menu, user_input)
    menu.key?(user_input)
  end
end
