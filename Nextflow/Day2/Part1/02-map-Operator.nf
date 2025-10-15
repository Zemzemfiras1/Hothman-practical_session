// Doc : --> https://www.nextflow.io/docs/latest/reference/operator.html#map

// "map" takes each element, applies your function, and gives back a NEW transformed stream

Channel.from(1,2,3,4)   // Create a channel (a sequence-like stream) with the values 1, 2, 3, and 4
        .view()

/*
Channel.from(1,2,3,4)   // Create a channel (a sequence-like stream) with the values 1, 2, 3, and 4
    .map { x -> x * 2 } // Transform each element: take x and multiply it by 2
    .view()             // View the result of the transformation
                        // Output will be: 2, 4, 6, 8

*/