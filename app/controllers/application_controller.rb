class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_institution

  private

  def set_institution
    @institution = current_user.institution rescue nil
  end

end
