class Util
  def self.host_url(url)
    referer     = URI::parse(url)
    host        = "#{referer.scheme}://#{referer.host}"
    host        +=":#{referer.port}" if referer.port != 80
    host
  end
end