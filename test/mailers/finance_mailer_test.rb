require "test_helper"

class FinanceMailerTest < ActionMailer::TestCase
  test "high_priced_widget" do
    widget = FactoryBot.build(:widget)
    mail = FinanceMailer.high_priced_widget(widget)
    assert_equal "High priced widget", mail.subject
    assert_equal ["finance@example.com"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match widget.name, mail.body.encoded
  end
end
