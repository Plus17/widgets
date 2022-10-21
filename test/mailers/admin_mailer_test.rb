require "test_helper"

class AdminMailerTest < ActionMailer::TestCase
  test "high_priced_widget" do
    widget = FactoryBot.build(:widget)
    mail = AdminMailer.new_widget_from_new_manufacturer(widget)
    assert_equal "New widget from new manufacturer", mail.subject
    assert_equal ["admin@example.com"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match widget.name, mail.body.encoded
  end

end
