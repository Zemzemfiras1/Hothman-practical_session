// doc --> https://www.nextflow.io/docs/latest/reference/operator.html#filter

// "filter" allows you to keep only the elements that match a condition (predicate).

Channel.from(1,2,3,4,5,6)        // Create a channel with the numbers 1 through 6
    .filter { it % 2 == 0 }      // Keep only elements where "it % 2 == 0" (i.e., even numbers)
    .view()                      // Show the results
                                 // Output: 2, 4, 6


/*
Channel.fromPath('./data/*.fastq.gz')         // Create a channel from all FASTQ files in the "data" directory
    .filter { it.toString().contains('_1') }  // Keep only files whose name contains "_1" 
    .view()                                   // Show the filtered file paths
*/