require "test_helper"

class WidgetTest < ActiveSupport::TestCase
  setup do
    @widget = FactoryBot.create(:widget)
  end

  test "valid prices do not trigger the DB constraint" do
    assert_nothing_raised do
      @widget.update_column(
        :price_cents, 45_00
      )
    end
  end

  test "negative prices do trigger the DB constraint" do
    exception = assert_raises do
      @widget.update_column(
        :price_cents, -45_00
      )
    end
    assert_match(/price_must_be_positive/i, exception.message)
  end

  test "when the name an empty string, it's normalized to nil" do
    widget = Widget.new(name: "")
    widget.validate
    assert_nil widget.name
  end

  test "when name is just a lot of spaces, it's normalized to nil" do
    widget = Widget.new(name: " ")
    widget.validate
    assert_nil widget.name
  end
end
