log.info """
----------------------------------------------------------------
collect
----------------------------------------------------------------
Collects all elements from a channel into a single list.         
Be careful with very large channels as this can consume memory.  
-----------------------------------------------------------------
doc --> https://www.nextflow.io/docs/latest/reference/operator.html#collect
-----------------------------------------------------------------
"""

// Teaching demo
Channel.from(1, 2, 3, 4)
    .view() 

/*
Channel.from(1, 2, 3, 4)
       .collect()
       .view()   // output: [1, 2, 3, 4]
*/