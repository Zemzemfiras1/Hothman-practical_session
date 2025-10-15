log.info"""
-------------------------------------------------------------------
groupTuple                                                           
------------------------------------------------------------------- 
Groups values by the first element of a tuple.                                           
Creates a tuple of the key and a list of all values for that key.         
-------------------------------------------------------------------
doc --> https://www.nextflow.io/docs/latest/reference/operator.html#grouptuple
---------------------------------------------------------------------------------------------------------------------------------     
"""

Channel.from([ 'A', 1 ], [ 'A', 2 ], [ 'B', 3 ])
    .view()   // output: [A, [1, 2]], [B, [3]]

/*
Channel.from([ 'A', 1 ], [ 'A', 2 ], [ 'B', 3 ])
    .groupTuple()
    .view()   // output: [A, [1, 2]], [B, [3]]
*/
