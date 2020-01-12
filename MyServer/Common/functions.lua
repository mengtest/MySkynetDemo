local print_table_str = ""
function print_table(v_t)
	if type(v_t) ~= "table" then
		print("print_table v_t is not table")
		return tostring(v_t)
	end
	print_table_str = ""
	return "{\r\n".._print_table(v_t).."}\r\n"
end

function _print_table(v_t)
	local str = ""
	for key,val in pairs(v_t) do
		if type(val) == "table" then
			str = str..key.." = {\r\n".._print_table(val).."\r\n},"
		else
			str = str..key.." = "..(val or "nil")..", "
		end
	end
	return str
end

function string.IsNullOrEmpty(v_str)
	return v_str == nil or v_str == ""
end

function string.printByte(v_str)
	local str = ""
	local len = string.len(v_str)
	for i=1,len do
		if i > 1 then
			str = str.." "
		end
		str = str .. string.byte(v_str,i)
	end
	return str
end

function string.safeFormat(v_s,...)
	local args = {...}
	local rtn = v_s
	for _i,val in ipairs(args) do
		local safeVal = val
		if type(val) == "table" then
			safeVal = print_table(val)
		else
			safeVal = tostring(val)
		end
		rtn = (string.gsub(rtn,"{".._i.."}",safeVal))
	end
	return rtn
end




LangUtil = {}
function LangUtil.Language(v_str)
	return v_str
end