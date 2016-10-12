class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale

  private

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def extract_locale
    # parsed_locale = request.host.split('.').last
    # parsed_locale = request.subdomains.first
    #parsed_locale = params[:locale] || request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/)[0]
    parsed_locale = if params[:locale]
                      params[:locale]
                    else
                      request.location.country_code ? request.location.country_code.downcase : nil
                    end
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end
end
