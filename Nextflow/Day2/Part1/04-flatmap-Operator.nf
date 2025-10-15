
log.info"""
---------------------------------------------------------------------------------------------------------------------------------
map                                                               | flatMap
---------------------------------------------------------------------------------------------------------------------------------
Transforms one element into zero, one, or many new elements.      | Transforms one element into one new element.                     
The channel size can grow or shrink depending on what you return. | The channel size stays the same (input count = output count).      
Example: expand each number into a list of values.                | Example: multiply every number by 2.                         
---------------------------------------------------------------------------------------------------------------------------------     
doc --> https://www.nextflow.io/docs/latest/reference/operator.html#flatmap
---------------------------------------------------------------------------------------------------------------------------------     
"""


// doc --> https://www.nextflow.io/docs/latest/reference/operator.html#flatmap

// The flatMap operator applies a mapping function to each item from a source channel.

// When the mapping function returns a list, each element in the list is emitted separately:

RawChannel = Channel.from('apple banana', 'cat dog')
    .view{ item -> "RawChannel: $item" }


RawChannel.flatMap { it.split(' ') }.view() // output: apple, banana, cat, dog



/*
// When the mapping function returns a map, each key-value pair in the map is emitted separately:

channel.of( 1, 2, 3 )
    .flatMap { n -> [ number: n, square: n*n, cube: n*n*n ] }
    .view { entry -> "${entry.key}: ${entry.value}" }

*/