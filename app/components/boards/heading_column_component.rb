# frozen_string_literal: true

class Boards::HeadingColumnComponent < ViewComponent::Base
  include BoardsHelper

  def initialize(data)
    @data = data
  end
end
