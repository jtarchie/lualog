local syslog = require("../parse")

describe("syslog message parsing", function()
  it("fails with an invalid message", function()
    local message = "invalid-message"
    assert.is_equal(syslog.parse(message, message:len()), -1)
  end)
  it("passes with a valid message", function()
    local message = "<1>1 - - - - - -"
    assert.is_equal(syslog.parse(message, message:len()), message:len())
  end)
end)
