require 'net/http'
require 'time_error'

RSpec.describe TimeError do
    it "returns difference in seconds between server time and the time on this computer" do
        text_requester_double = double :text_requester
        expect(text_requester_double).to receive(:get).with(URI("https://worldtimeapi.org/api/ip")).and_return('{"abbreviation":"BST","client_ip":"2a02:c7c:36d7:f700:8076:520a:4bd8:ae18","datetime":"2022-09-01T16:18:00.940238+01:00","day_of_week":4,"day_of_year":244,"dst":true,"dst_from":"2022-03-27T01:00:00+00:00","dst_offset":3600,"dst_until":"2022-10-30T01:00:00+00:00","raw_offset":0,"timezone":"Europe/London","unixtime":1662045480,"utc_datetime":"2022-09-01T15:18:00.940238+00:00","utc_offset":"+01:00","week_number":35}')
        time = Time.new(2022, 9, 1, 16, 18, 0)

        time_error = TimeError.new(text_requester_double)
        expect(time_error.error(time)).to eq 0.940238
    end
end