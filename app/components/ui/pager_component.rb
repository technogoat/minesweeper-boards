# frozen_string_literal: true

class Ui::PagerComponent < ViewComponent::Base
  include Pagy::Frontend

  def initialize(pagy)
    @pagy = pagy
  end
end
