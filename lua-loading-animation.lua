local LoadingAnimation = {}
LoadingAnimation.__index = LoadingAnimation

-- Constructor
function LoadingAnimation:new(times, delay, symbols)
	local obj = setmetatable({}, LoadingAnimation)
	obj.times = times or 20
	obj.delay = delay or 0.1
	obj.symbols = symbols or { "-", "\\", "|", "/" }
	return obj
end

-- Define a method
function LoadingAnimation:animate()
	for i = 1, self.times do
		local frame = self.symbols[(i % #self.symbols) + 1]
		io.write("\r") -- Move the cursor to the beginning of the line
		io.write(frame) -- Print the current frame
		io.flush() -- Flush the output buffer to ensure the frame is displayed
		os.execute("sleep " .. self.delay)
	end
	io.write("\r \r")
end

return LoadingAnimation
