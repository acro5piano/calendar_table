module CalendarTable
  class Base
    def initialize(year:nil, month: nil)
      @year = year || Date.today.year
      @month = month || Date.today.month
    end

    def table
      last_day = Date.new(@year, @month, -1).day
      table = []

      # Set content
      1.upto(last_day) do |day|
        table.push htmlize(day: day, content: day)
      end

      # Fill in blanks
      table = unshift_calendar(table)
      table = push_calendar(table)

      # Add header
      header = []
      Calendar.configuration.weekdays.each_with_index do |wday_name, idx|
        header.push htmlize(wday: idx, content: wday_name)
      end

      table = header + table
      table
    end

    def unshift_calendar(table)
      first_wday = Date.new(@year, @month, 1).wday
      0.upto(first_wday - 1) do |wday|
        table.unshift htmlize(wday: wday)
      end
      table
    end

    def push_calendar(table)
      last_wday = Date.new(@year, @month, -1).wday + 1
      last_wday.upto(6) do |wday|
        table.push htmlize(wday: wday)
      end
      table
    end

    def htmlize(wday: nil, day: nil, content: '', header: false)
      wday ||= Date.new(@year, @month, day).wday
      cell_tag = header ? 'th' : 'td'

      case wday
      when 0 then '<tr><td class="%s">%s</td>' % [Calendar.configuration.class_sunday, content]
      when 1 then '<td class="%s">%s</td>' % [Calendar.configuration.class_monday, content]
      when 2 then '<td class="%s">%s</td>' % [Calendar.configuration.class_tuesday, content]
      when 3 then '<td class="%s">%s</td>' % [Calendar.configuration.class_wednesday, content]
      when 4 then '<td class="%s">%s</td>' % [Calendar.configuration.class_thursday, content]
      when 5 then '<td class="%s">%s</td>' % [Calendar.configuration.class_friday, content]
      when 6 then '<td class="%s">%s</td></tr>' % [Calendar.configuration.class_saturday, content]
      end
    end
  end
end
