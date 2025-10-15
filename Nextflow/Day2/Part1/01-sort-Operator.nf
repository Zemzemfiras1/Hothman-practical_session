// Define a simple process called 'foo'
process foo {
    input:
        // Input: a single value 'x'
        val x
    output:
        // Output: the same value 'x'
        val(x) 

    script:
    """
    # No actual commands in the script block (empty)
    """
}

// Create a channel with values 'C', 'A', 'B', 'D'
input_ch = channel.of('C', 'A', 'B', 'D') 

// Define workflow
workflow {
    // Convert channel values into a list and display them
    input_ch.toList().view()
    
    // Example usage (currently commented out):
    // Pass input channel through 'foo' process and view results
    
    // result = foo(input_ch).view()
    
    // Convert results into a list and view (unsorted)
    // result.toList().view()  
    
    // Collect results, sort them, and view (while keeping index-value pairs)
    // result.collect(sort: true).view()  
}
