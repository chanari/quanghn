class Api::V1::ShortLinksController < Api::ApplicationController
  before_action :authenticate!

  def create
    short_path = GenerateShortenService.call(@current_user, params[:original_url])

    render json: { short_link: short_link_url(short_path) }, status: :created
  end
end
