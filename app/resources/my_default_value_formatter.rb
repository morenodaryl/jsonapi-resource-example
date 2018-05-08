class MyDefaultValueFormatter < DefaultValueFormatter
  class << self
    def format(raw_value)
      case raw_value
        when Date, Time, DateTime, ActiveSupport::TimeWithZone, BigDecimal
          return I18n.l(raw_value)
        else
          return raw_value
      end
    end
  end
end