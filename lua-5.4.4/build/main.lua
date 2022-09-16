-- local socket = require("socket")
-- local server = assert(socket.bind("*", 0))
-- local ip, port = server:getsockname()
-- print("server open on port " .. port)
-- local client = server:accept();

local socket = require("socket")
local mime = require("mime")
print("Hello from " .. socket._VERSION .. " and " .. mime._VERSION .. "!")