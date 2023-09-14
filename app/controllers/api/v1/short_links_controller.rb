class Api::V1::ShortLinksController < Api::ApplicationController
  before_action :authenticate!

  def create
  end

  private

  def short_links_params
    params.require(:short_links).permit(:source_link, )
  end
end
