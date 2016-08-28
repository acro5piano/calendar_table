module CalendarTable
  class Configuration
    attr_accessor :class_sunday,
                  :class_monday,
                  :class_tuesday,
                  :class_wednesday,
                  :class_thursday,
                  :class_friday,
                  :class_saturday,
                  :use_twitter_bootstrap,
                  :weekdays,
                  :class_header,

    def initialize
      @class_sunday = 'calendar__sunday'
      @class_monday = 'calendar__monday'
      @class_tuesday = 'calendar__tuesday'
      @class_wednesday = 'calendar__wednesday'
      @class_thursday = 'calendar__thursday'
      @class_friday = 'calendar__friday'
      @class_saturday = 'calendar__saturday'

      if @use_twitter_bootstrap
        @class_sunday = 'calendar__sunday bg-danger'
        @class_saturday = 'calendar__saturday bg-info'
      end
    end
  end
end
