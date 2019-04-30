# Maze Runner

# Introduction
#      Welcome Adventurer. Your aim is to navigate the maze and reach the finish point without
#      touching any walls. Doing so will kill you instantly!

# Task
#      You will be given a 2D array of the maze and an array of directions.
#      Your task is to follow the directions given.
#      If you reach the end point before all your moves have gone, you should return Finish.
#      If you hit any walls or go outside the maze border, you should return Dead.
#      If you find yourself still in the maze after using all the moves, you should return Lost.

# The Maze array will look like

# maze = [[1,1,1,1,1,1,1],
#         [1,0,0,0,0,0,3],
#         [1,0,1,0,1,0,1],
#         [0,0,1,0,0,0,1],
#         [1,0,1,0,1,0,1],
#         [1,0,0,0,0,0,1],
#         [1,2,1,0,1,0,1]]

#         ..with the following key

#         0 = Safe place to walk
#         1 = Wall
#         2 = Start Point
#         3 = Finish Point

# Rules
#     1. The Maze array will always be square i.e. N x N
#     2. The start and finish positions could be anywhere in the maze
#     3. The directions array will always be in upper case and will be in the format of:
#         N = North, E = East, W = West and S = South. (North is assumed to be the top)

# Good luck, and stay safe!

class Maze
    attr_accessor :start_point, :end_point, :death_locations

    def initialize(maze)
        @maze = maze
        # Need to initialise the beginning and end points for this maze
        @start_point = start_point 
        @end_point = end_point
        @death_locations = death_locations
    end

    def walk(moves)
        # your code here
        # Create a hash of movements made, with each addition making a check against the new position this would place the character in
        current_position = @start_point
        
        moves.each do |move|
            case move
            when "N"
                current_position[:x_pos] += 1
            when "S"
                current_position[:x_pos] -= 1
            when "E"
                current_position[:y_pos] += 1
            when "W"
                current_position[:y_pos] -= 1
            end
            
            if current_position[:x_pos] < 0 or current_position[:y_pos] < 0
                return "Dead"
            end

            if @death_locations.include?([current_position[:x_pos], current_position[:y_pos]])
                return "Dead"
            elsif current_position == @end_point
                return "Finish"
            end
        end

        return "Lost"
    end

    def start_point
        acc = @maze.length - 1
        @maze.each do |maze_row|
            if maze_row.include?(2)
                return {x_pos: maze_row.find_index(2), y_pos: acc}
            end
            acc -= 1
        end
    end

    def end_point
        acc = @maze.length - 1
        @maze.each do |maze_row|
            if maze_row.include?(3)
                return {x_pos: maze_row.find_index(3), y_pos: acc}                
            end
            acc -= 1
        end
    end

    def death_locations
        death_locations = []
        row_acc = @maze.length - 1
        @maze.each do |maze_row|
            # num_death_locations_in_row = maze_row.count(1)
            death_locations_in_row = maze_row.each_index.select { |x| maze_row[x] == 1 }
            
            death_locations_index_acc = 0
            death_locations_in_row.length.times do |death_location|
                death_locations << [death_locations_in_row[death_locations_index_acc], row_acc]
                death_locations_index_acc += 1
            end
        end

        return death_locations
    end
end
