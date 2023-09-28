module ApplicationHelper
  def add_params(url, params = {})
    uri = URI(url)
    params    = Hash[URI.decode_www_form(uri.query || '')].merge(params)
    uri.query =      URI.encode_www_form(params)
    uri.to_s
  end
end
