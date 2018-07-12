local ffi = require("ffi")

ffi.cdef([[
  int parse(const char* p, int len)
]])
local syslog = ffi.load("parse")

return syslog
