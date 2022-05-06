# class to provide counting logic
class IncomeCounter
  attr_reader :events

  # takes Events list as arguments:
  # ["filled", "created", "filled", "returned", "filled", "filled"]
  def initialize(events)
    @events = events
  end

  # rejects events that may be invalid for counting:
  # ["created", "filled", "returned", "filled", "filled"]
  # and counts income of fillings/returnings as an Integer
  def call
    valid_events = reject_invalid(events)
    balance = valid_events.count('filled') - valid_events.count('returned')
    (balance * 5) - valid_events.count('returned')
  end

  private

  def reject_invalid(events)
    return unless events.is_a?(Array)

    events.drop_while { |event| event != 'created' }
  end
end
