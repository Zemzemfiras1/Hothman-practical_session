log.info """
---------------------------------------------------------------------------------------------------------------------------------
combine                                                      | join
---------------------------------------------------------------------------------------------------------------------------------
Produces all combinations of two channels (Cartesian product)| Merges two channels based on matching keys
The output channel contains every pairing of elements from   | Only emits elements where keys match in both channels
the two input channels.                                      | Requires key-value tuples (or lists with keys)
Example: pair ['A','B'] with [1,2] →                         | Example: merge [[1,'A'],[2,'B']] with [[1,'X'],[2,'Y']] →
[A,1], [A,2], [B,1], [B,2]                                   | [1,[A,X]], [2,[B,Y]]
Use when you want all possible combinations                  | Use when you want to merge datasets with matching keys
---------------------------------------------------------------------------------------------------------------------------------
doc -->   https://www.nextflow.io/docs/latest/reference/operator.html#join
---------------------------------------------------------------------------------------------------------------------------------
"""


a = Channel.from([1,'apple'], [2,'banana'])
b = Channel.from([1,'red'], [2,'yellow'], [3,'green'])

a.join(b)
    .view()   // output: [1, apple, red], [2, banana, yellow]