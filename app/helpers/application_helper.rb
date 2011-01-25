module ApplicationHelper
  # Include ancestors, e.g. Admin::UsersController -> "admin_users"
  def underscored_controller_name
    controller.class.name.underscore.gsub('_controller', '').gsub('/', '_')
  end

  def body_css_classes
    "#{underscored_controller_name} #{underscored_controller_name}_#{action_name}"
  end

end
