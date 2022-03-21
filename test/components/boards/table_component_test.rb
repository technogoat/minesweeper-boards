# frozen_string_literal: true

require 'test_helper'

class Boards::TableComponentTest < ViewComponent::TestCase
  def test_empty_table
    render_inline(Boards::TableComponent.new)
    assert_selector('th', text: 'Loading...')
  end
end
