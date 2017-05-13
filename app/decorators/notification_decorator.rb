class NotificationDecorator < Draper::Decorator
  decorates :notification
  include Draper::LazyHelpers
  
  def display_event_date
    if source.start_date.blank? and source.end_date.blank?
      return ""
    elsif not source.start_date.blank? and source.end_date.blank?
      return l source.start_date, format: "%e %B %Y "
    elsif not source.start_date.blank? and not source.end_date.blank?
      if source.start_date.year != source.end_date.year
        return "#{l source.start_date, format: "%e %B %Y"} al #{l source.end_date, format: "%e %B %Y"}"
      elsif source.start_date.year == source.end_date.year and source.start_date.month != source.end_date.month
        return "#{l source.start_date format: "%e de %B"} al #{l source.end_date format: "%e de %B"}"
      elsif source.start_date.year == source.end_date.year and source.start_date.month == source.end_date.month and source.start_date.day != source.start_date.day
        return "#{l source.start_date format: "%e"} al #{l surce.end_date format: "%e %B"}"
      elsif source.start_date.year == source.end_date.year and source.start_date.month == source.end_date.month and source.start_date.day == source.start_date.day
        return l source.start_date, format: "%e %B %Y"
      end
    end
  end
  
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%e/%y")
  #     end
  #   end

end
