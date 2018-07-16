local ffi = require("ffi")
local bit = require("bit")

ffi.cdef([[
  struct log {
    int version;
    int priority;
    char * hostname;
    char * appname;
    char * procid;
    char * msgid;
  };
  int parse(const char* p, int len, struct log *log);
]])
local syslog = ffi.load("parse")

local log = {}
log.__index = log

function log.new(l)
  local self = setmetatable({}, log)
  self.log = l
  return self
end

function log:version()
  return self.log.version
end

function log:severity()
  return bit.band(self.log.priority, 7)
end

function log:facility()
  return bit.rshift(self.log.priority, 3)
end

function log:priority()
  return self.log.priority
end

function log:hostname()
  return ffi.string(self.log.hostname)
end

function log:appname()
  return ffi.string(self.log.appname)
end

function log:procid()
  return ffi.string(self.log.procid)
end

function log:msgid()
  return ffi.string(self.log.msgid)
end

local parse = function(msg)
  local l = ffi.new("struct log", {})
  local parse_len = syslog.parse(msg, msg:len(), l)
  return log.new(l), parse_len
end

--TODO; http://luajit.org/ext_ffi_api.html#extended

return {
  parse = parse
}
