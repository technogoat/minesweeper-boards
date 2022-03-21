# frozen_string_literal: true

class Ui::ButtonComponent < ViewComponent::Base
  def initialize(text, path, classes, data)
    @text = text
    @path = path
    @classes = classes
    @data = data
  end
end
