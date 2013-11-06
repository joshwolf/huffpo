# Identify ascending/descending runs of 3 numbers in an unsorted array. Runs can be identified where the sum of the elements in the run == middle element X 3



def findConsecutiveRuns(arr)
    arr_length = arr.length
    if arr_length < 3
        nil
    else
        consecutive_runs_array = []
        pos = 0
        arr.each do |element|
            #make sure we can get a full run to test
            if (pos + 3) <= arr_length
                this_run = arr[pos,3]
                #test for consecutive
                sum = this_run.inject(:+)
                #is run unique and does sum = middle element X 3?
                if (sum == (this_run[1] * 3)) && this_run.uniq.length == this_run.length
                    consecutive_runs_array.push(pos)
                end
                pos += 1
            end
        end
        if !consecutive_runs_array.any?
            nil
        else
            consecutive_runs_array.to_s
        end
    end
end
	
input_arg = ARGV[0]
if input_arg.nil?
	puts 'No input specified!'
	exit
end
input_array = input_arg.split(',')
#convert array to ints
input_array.collect!{|x| x = x.to_i}

#do the work
puts findConsecutiveRuns(input_array)

