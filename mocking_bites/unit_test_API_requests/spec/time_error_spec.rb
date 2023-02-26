require "time_error"
require 'net/http'

describe TimeError do
  it "returns the difference in seconds between server time and the time on this computer" do
    fake_requester = double :requester
    allow(fake_requester).to receive(:get).with(URI("https://worldtimeapi.org/api/ip"))
    .and_return('{"abbreviation":"GMT","client_ip":"82.39.96.57","datetime":"2023-02-26T15:54:17.937811+00:00","day_of_week":0,"day_of_year":57,"dst":false,"dst_from":null,"dst_offset":0,"dst_until":null,"raw_offset":0,"timezone":"Europe/London","unixtime":1677426857,"utc_datetime":"2023-02-26T15:54:17.937811+00:00","utc_offset":"+00:00","week_number":8}')
    time_error = TimeError.new(fake_requester)
    time = Time.new(2023, 02, 26, 15, 54, 17)
    expect(time_error.error(time)).to eq 0.937811
  end
end