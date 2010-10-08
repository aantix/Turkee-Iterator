class Util
  def self.host_url(url)
    referer     = URI::parse(url)
    host        = "#{referer.scheme}://#{referer.host}"
    host
  end
end