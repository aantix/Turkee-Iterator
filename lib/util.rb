class Util
  def self.host_url(url)
    referer     = URI::parse(url)
    host        = "#{referer.scheme}://#{referer.host}:#{referer.port}"
    host
  end
end