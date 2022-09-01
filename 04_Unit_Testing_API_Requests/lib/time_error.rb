require 'json'
require 'date'
require 'net/http'


class TimeError
  # Returns difference in seconds between server time
  # and the time on this computer
  def initialize(text_requester)
    @text_requester = text_requester
  end

  def error(current_time)
    return get_server_time - current_time
  end

  private

  def get_server_time
    text_response = @text_requester.get(URI("https://worldtimeapi.org/api/ip"))
    json = JSON.parse(text_response)
    return DateTime.parse(json["utc_datetime"]).to_time
  end
end


# time_error = TimeError.new(Net::HTTP)
# time_error.error
# time_error.error


