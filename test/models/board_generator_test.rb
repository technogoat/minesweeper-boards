require 'test_helper'

class BoardGeneratorTest < ActiveSupport::TestCase
  test 'returns proper two dimensional array' do
    b = BoardGenerator.new(3, 3, 3)
    data = b.generate

    assert_equal 3, data.length
    data.length.times do |i|
      assert_equal 3, data[i].length
    end
  end

  test 'returns correct amount of bombs' do
    b = BoardGenerator.new(5, 5, 20)
    data = b.generate

    assert_equal 20, data.flatten.filter { |bomb| bomb == 1 }.length
  end
end
