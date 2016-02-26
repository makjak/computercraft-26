
function left(number)
	for i = 1, number do
		turtle.turnLeft()
	end
end
function right(number)
	for i = 1, number do
		turtle.turnRight()
	end
end
function down(number)
	for i = 1, number do
		turtle.digDown()
		turtle.down()
	end
end
function up(number)
	for i = 1, number do
		turtle.digUp()
		turtle.up()
	end
end
function forward(number)
	for i = 1, number do
		turtle.dig()
		turtle.forward()
	end
end

function emptyInventory()
	tar = "minecraft:stone"
	local isBlock, data = turtle.inspect()
	if isBlock and data.name == tar then
		for i = 1, 13 do
			turtle.select(i)
			turtle.drop()
		end
	end
end

function inspect()
	local isOre, block = turtle.inspect()
	blockName = block.name
	length = strlen(blockName)
	return isOre and strsub(blockName, length-4, length-1)  == "ore"
end
function inspectDown()
	local isOre, block = turtle.inspectDown()
	blockName = block.name
	length = strlen(blockName)
	return isOre and strsub(blockName, length-4, length-1)  == "ore"
end
function inspectUp()
	local isOre, block = turtle.inspectUp()
	blockName = block.name
	length = strlen(blockName)
	return isOre and strsub(blockName, length-4, length-1)  == "ore"
end

function branching(numberOfBranches, lengthOfBranches)
	for i = 1, numberOfBranches do
		forward(1)
		if left then 
			left(1)
			goLeft = false
		else
			right(1)
			goLeft = true
		end
		for direction=1, 2 do
			for branch = 0, lengthOfBranches, 1 do
				mineVein()
			end
			turtle.digUp()
			turtle.turnLeft()
			turtle.turnLeft()
		end
	end
end

function mineVein()
	forward(1)
	if inspectUp()
		mineVein()
	end
	if inspectDown()
		mineVein()
	end
		left(1)
	if inspect()
		mineVein()
	end
	right(2)
	if inspect()
		mineVein()
	end
end	