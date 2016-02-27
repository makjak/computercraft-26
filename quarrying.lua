args = {...}
length = args[1]
width = args[2]
height = args[3]
floorspace = args[4]

function df()
	local k = false
	while not k do
		turtle.dig()
		k = turtle.forward()
	end
end

function tl()
	turtle.turnLeft()
	return true
end

function tr()
	turtle.turnRight()
	return false
end

function turn()
	turtle.turnLeft()
	turtle.turnLeft()
end

function du(n)
	turtle.digUp()
	turtle.up()
end

function dd(n)
	for i=1, n do
		turtle.digDown()
		turtle.down()
	end
end

function triplet()
	df()
	turtle.digUp()
	turtle.digDown()
end

function quarry(l, w, h, fp)
	local right = true
	notTriplets = h%3
	tripletsNum = (h-notTriplets)/3
	depth = h-tripletsNum*fp
	notTriplets = depth%3
	tripletsNum = (depth-notTriplets)/3

	dd(2)
	turtle.digDown()
	for i=1, tripletsNum do
		for j=2, w do	
			for k=2, l do
				triplet()
			end
			if right then
				right = tr()
				triplet()
				tr()
			else
				right = tl()
				triplet()
				tl()
			end
		end
		for k=2, l do
				triplet()
		end
		if i==tripletsNum and notTriplets>0 then
			dd(1+fp)
		elseif i~=tripletsNum then
			dd(3+fp)
		end
		if right then
			turn()
		else
			tr()
			right = true
		end
	end
	for i=1, notTriplets do
		right = true
		for j=1, w do
			for k=2, l do
				df()
			end
			if right then
				right = tr()
				df()
				tr()
			else
				right = tl()
				df()
				tl()
			end
		end
		if right then
			turn()
		else
			tr()
			right = true
		end
		if i~=notTriplets then
			dd(1)
		end
	end	
end

quarry(length, width, height, floorspace)