module CalendarTable
  def self.configuration
    @configuration ||= CalendarTable::Configuration.new
  end

  def self.configure
    yield configuration if block_given?
    @@configuration = configuration
  end
end
