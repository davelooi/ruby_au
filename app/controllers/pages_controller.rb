class PagesController < ApplicationController
  rescue_from ActionView::MissingTemplate do |exception|
    if exception.message.match?(/Missing template pages#{request.path}/)
      raise ActionController::RoutingError, "No such page: #{params[:id]}"
    else
      raise exception
    end
  end

  def show
    render "pages/#{params[:id]}"
  end
end
