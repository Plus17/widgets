class Widget < ApplicationRecord
  after_save :log_caller

  validates :name, {presence: true}
  validates :manufacturer_id, {presence: true}
  validates :name, {presence: true, length: {minimum: 5}}
  validates :price_cents, numericality: {less_than_or_equal_to: 10_000_00, greater_than: 0},
    high_enough_for_legacy_manufacturers: true

  belongs_to :manufacturer
  belongs_to :widget_status

  before_validation do
    if self.name.blank?
      self.name = nil
    end
  end

  def user_facing_identifier
    id_as_string = id.to_s
    if id_as_string.length < 3
      return id_as_string
    end

    "%{first}.%{last_two}" % {
      first: id_as_string[0..-3],
      last_two: id_as_string[-2..]
    }
  end

  private

  def log_caller
    Rails.logger.info "#{self.class} saved by #{caller(1..1).first}"
  end
end