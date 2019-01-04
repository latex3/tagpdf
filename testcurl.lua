for k,v in pairs (os.env) do
print (k,v)
end
local fp = assert(io.popen("curl -help", 'r'))
