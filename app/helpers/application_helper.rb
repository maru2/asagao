module ApplicationHelper

  def page_title
    title = "Morning Glory"
    title = @page_title + " - " + title if @page_title
    title
  end

  def menu_link_to(text, path)
    link_to_unless_current(text, path) { content_tag(:span, text) }
  end

  def flash_class(level)
    case level
        when :notice then "alert alert-info"
        when :success then "alert alert-success"
        when :error then "alert alert-error"
        when :alert then "alert alert-error"
    end
  end

end
