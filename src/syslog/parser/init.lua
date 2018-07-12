local ffi = require("ffi")

ffi.cdef([[
  int parse(const char* p, int len)
]])
local syslog = ffi.load("parse")

local parse = function(msg)
  return syslog.parse(msg, msg:len())
end

return {
  parse = parse
}
