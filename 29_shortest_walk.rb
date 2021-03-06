# Shortest walk
# Difficulty: hard

# A man was given directions to go from one point to another.
# The directions were "NORTH", "SOUTH", "WEST", "EAST". 
# Clearly "NORTH" and "SOUTH" are opposite, "WEST" and "EAST" too. 
# Going to one direction and coming back the opposite direction is a needless effort. 
# Since this is the wild west, with dreadfull weather and not much water, 
# it's important to save yourself some energy, otherwise you might die of thirst!

# How I crossed the desert the smart way.
# The directions given to the man are, for example, the following:

# ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"].

# You can immediatly see that going "NORTH" and then "SOUTH" is not reasonable, 
# better stay to the same place! So the task is to give to the man a simplified 
# version of the plan. A better plan in this case is simply:

# ["WEST"]

# Other examples:
# In ["NORTH", "SOUTH", "EAST", "WEST"], 
# the direction "NORTH" + "SOUTH" is going north and coming back right away. 
# What a waste of time! Better to do nothing.

# The path becomes ["EAST", "WEST"], now "EAST" and "WEST" annihilate each other, 
# therefore, the final result is [] 

# In ["NORTH", "EAST", "WEST", "SOUTH", "WEST", "WEST"], 
# "NORTH" and "SOUTH" are not directly opposite but they become directly 
# opposite after the reduction of "EAST" and "WEST" so the whole path is reducible 
# to ["WEST", "WEST"].

# Task
# Write a function shortest_walk which will take an array of strings and 
# returns an array of strings with the needless directions removed 
# (W<->E or S<->N side by side).

# Examples
# shortest_walk(["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"]) # => ["WEST"]
# shortest_walk(["NORTH", "SOUTH", "EAST", "WEST"]) # => []

# The test with the challenge use rspec

# So to me this immediately indicates iterative index comparison
# Loop through array checking to see if index has an opposing walk direction
# in either previous index or next index
# (previous is important here because if in the previous iteration we deleted two
# two indexes we may now have a backwards match that may not have existed before)
# Iterate, make a case statement for the index. If S check i-1, i+1, for N,
# if N, check i-1, i+1 for S, and ditto for E/W 

def shortest_walk(walk)
    # your code goes here   

	walk.length.times do
		walk.each do |index|
			case index
			when "NORTH"
				if walk[walk.index(index) - 1] == "SOUTH"
					# DELETE, CHECK SYNTAX
					walk.delete_at(walk.index(index) - 1)	
					walk.delete_at(walk.index(index))
				elsif walk[walk.index(index) + 1] == "SOUTH"
					# ^^^
					walk.delete_at(walk.index(index) + 1)
					walk.delete_at(walk.index(index))
				end
			when "SOUTH"
				if walk[walk.index(index) - 1] == "NORTH"
					# DELETE, CHECK SYNTA
					walk.delete_at(walk.index(index) - 1)
					walk.delete_at(walk.index(index))
				elsif walk[walk.index(index) + 1] == "NORTH"
					# ^^^
					walk.delete_at(walk.index(index) + 1)
					walk.delete_at(walk.index(index))
				end
			when "EAST"
				if walk[walk.index(index) - 1] == "WEST"
					# DELETE, CHECK SYNTAX
					walk.delete_at(walk.index(index) - 1)
					walk.delete_at(walk.index(index))
				elsif walk[walk.index(index) + 1] == "WEST"
					# ^^^
					walk.delete_at(walk.index(index) + 1)
					walk.delete_at(walk.index(index))
				end
			when "WEST"
				if walk[walk.index(index) - 1] == "EAST"
					# DELETE, CHECK SYNTAX
					walk.delete_at(walk.index(index) - 1)
					walk.delete_at(walk.index(index))
				elsif walk[walk.index(index) + 1] == "EAST"
					# ^^^
					walk.delete_at(walk.index(index) + 1)
					walk.delete_at(walk.index(index))
				end
			end
		end
	end
    return walk
end

p shortest_walk(["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"])
p shortest_walk(["NORTH", "SOUTH", "EAST", "WEST"])
p shortest_walk(["NORTH", "EAST", "SOUTH"])
p shortest_walk(["EAST", "SOUTH", "SOUTH", "SOUTH", "WEST", "SOUTH"])
