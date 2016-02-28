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

function dropShit()
	for i=1, 16 do
		turtle.select(i)
		local data = turtle.getItemDetail()
		if not data.name=="minecraft:diamond" then
			turtle.drop()
		elseif not data.name=="minecraft:redstone" then
			turtle.drop()
		elseif not data.name=="minecraft:gold_ore" then
			turtle.drop()
		elseif not data.name=="minecraft:iron_ore" then
			turtle.drop()
		elseif not data.name=="minecraft:dye" then
			turtle.drop()
		end
	end
end

function quarry(l, w, h, fp)
	local right = true

	depth = h
	notTriplets = depth%3
	tripletsNum = (depth-notTriplets)/3

	stagesSkipped = 0

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
			local isBlock, data = turtle.inspectDown()
			if data.name == "minecraft:bedrock" then
				os.shutdown()
			end
		end
		for k=2, l do
				triplet()
		end
		if i==tripletsNum and notTriplets>0 then
			dd(1+fp)
		elseif i~=tripletsNum then
			dd(3+fp)
			turtle.digDown()
		end
		if right then
			turn()
		else
			tr()
			right = true
		end
		dropShit()
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
		dropShit()
	end	
end

quarry(length, width, height, floorspace)