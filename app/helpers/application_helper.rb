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

end
