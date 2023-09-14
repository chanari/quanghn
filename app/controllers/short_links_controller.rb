class ShortLinksController < ApplicationController
  def show
    short_link = ShortLink.find_by!(short_path: params[:short_path])

    redirect_to short_link.original_url, allow_other_host: true
  end
end
