class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  AVAILABLE_LOCALES = Dir.glob(Rails.root.join('config', 'locales', '*.yml')).collect do |path|
    File.basename(path).split('.')[-2].to_sym
  end.uniq.sort

  def set_locale
    # The locale to use for this request is established from one of the following locations, in order of priority:
    #   params[:locale]
    #   session[:locale]
    #   User's preferred locale if logged in TODO: NOT YET SUPPORTED
    #   I18n.default_locale

    # user_preferred_locale = current_user && current_user.preferred_locale
    locale = params[:locale] || session[:locale] # || user_preferred_locale
    if locale && AVAILABLE_LOCALES.include?(locale.to_sym)
      #if current_user
      #  current_user.preferred_locale = locale.to_s
      #  current_user.save if current_user.preferred_locale_changed?
      #end
    else
      locale = I18n.default_locale
    end
    session[:locale] = locale
    I18n.locale = locale
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    redirect_to root_url
  end

end
