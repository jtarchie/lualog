local syslog=require("../syslog/parser")

describe("syslog message parsing", function()
  it("fails with an invalid message", function()
    local message = "invalid-message"
    local _msg, read = syslog.parse(message)
    assert.is_equal(read, -1)
  end)
  it("passes with a valid message", function()
    local message = "<1>1 - - - - - -"
    local _msg, read = syslog.parse(message)
    assert.is_equal(read, message:len())
  end)
  context("ensure the message body is parsed", function()
    it("handles all fields", function()
      local message = [[<34>1 2003-10-11T22:14:15.003Z mymachine.example.com su 12345 98765 [exampleSDID@32473 iut="3" eventSource="Application" eventID="1011"] 'su root' failed for lonvick on /dev/pts/8]]
      local msg, read = syslog.parse(message)
      assert.is_equal(read, message:len())
      assert.is_equal(msg.version, 1)
    end)
  end)
end)
