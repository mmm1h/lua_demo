local require = require;

local http = require("socket.http")
local ltn12 = require("ltn12")
local server_url = "http://172.16.2.153:8085/api/appList.do"
local dkjson = require("dkjson")
require("cc_helper")

function get_tocken()
    local t = base64_enc("service_auth:gmisagoodman")
    local b = string.gsub(t,"=","")
    return b;
end

function get_start()
	request_body = {
	}
	local response_body = {}
	local res, code, response_headers = http.request{
		url = server_url,
		method = "GET",
		headers =
		{
			["Authorization"] = "Basic " .. get_tocken();
		},
		source = ltn12.source.string(dkjson.encode(request_body)),
		sink = ltn12.sink.table(response_body)
	}
    if code == 200 then
        if type(response_body) == "table" then
            -- local result, _, err3 = dkjson.decode(response_body[1])
            print(response_body[1])
        end
    end
end

function function_name()
    local name = io.read()
    print("name =", name, "type(name) =", type(name))
end

-- cc_print()

get_start()