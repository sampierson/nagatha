module ApplicationHelper
  # Include ancestors, e.g. Admin::UsersController -> "admin_users"
  def underscored_controller_name
    controller.class.name.underscore.gsub('_controller', '').gsub('/', '_')
  end

  def body_css_classes
    "#{underscored_controller_name} #{underscored_controller_name}_#{action_name}"
  end

  def javascript_include_tags
    js_files = %w{
      rails
      plugins
      nagatha/nagatha
    } + Dir.glob("#{Rails.root}/public/javascripts/nagatha/pages/**/*.js").map { |file| file.gsub(/^#{Rails.root}\/public/, '') }
    javascript_include_tag js_files
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column.to_s == sort_column) ? "current_sort #{sort_direction}" : nil
    direction = (column.to_s == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end

  def time_ago(time)
    time ? distance_of_time_in_words(Time.now - time) + " ago" : '&nbsp;'.html_safe
  end

end
