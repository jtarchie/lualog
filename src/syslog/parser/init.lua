local ffi = require("ffi")

ffi.cdef([[
  struct log {
    int version;
    int severity, facility, priority;
    char * hostname;
    char * appname;
    char * procid;
    char * msgid;
  };
  int parse(const char* p, int len, struct log *log);
]])
local syslog = ffi.load("parse")

local parse = function(msg)
  local log = ffi.new("struct log", {})
  local parse_len = syslog.parse(msg, msg:len(), log)
  return log, parse_len
end

--TODO; http://luajit.org/ext_ffi_api.html#extended

return {
  parse = parse
}
