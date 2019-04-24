# Group by owners
# Implement a group_by_owners function that:
# Accepts a hash containing the file owner name for each file name.
# Returns a hash containing an array of file names for each owner name, in any order.

# Example: 
# group_by_owners({'Input.txt' => 'Randy', 'Code.py' => 'Stan', 'Output.txt' => 'Randy'}
# should return {'Randy' => ['Input.txt', 'Output.txt'], 'Stan' => ['Code.py']}

# Have a look at the tests and take note of the different expect assertions used.
# Using these assertions allows testing without expecting a particular order of the files
# in the lists for each owner.

def group_by_owners(input)
    # Your code goes here
    # Search for .txt in either the key or the value and put into a new hash (which will be the return hash) in the value component.
    # Look for any further instances of the new keys in the input hash.
    output = {}
    input.each do |k, v|
        if output.has_key?(k)
            output[k] << v
        elsif output.has_key?(v)
            output[v] << k
        else
            if v.include?('.')
                output[k] = [v]
            elsif k.include?('.')
                output[v] = [k] 
            end
        end
    end
    
    return output

end