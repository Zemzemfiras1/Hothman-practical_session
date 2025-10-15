log.info """
-------------------------------------------------------------------------------------------
combine
-------------------------------------------------------------------------------------------
Produces all combinations (cross product / Cartesian product) of two source channels 
or a channel and a list.                                             |
Each combination is emitted separately as a tuple.                  |
-------------------------------------------------------------------------------------------
doc --> https://www.nextflow.io/docs/latest/reference/operator.html#combine
-------------------------------------------------------------------------------------------
"""


a = Channel.from(1,2)
b = Channel.from('x','y')

a.combine(b)
    .view()   // output: [1,x], [1,y], [2,x], [2,y]


b.combine(a)
    .view()   // output: [x, 1], [y, 1], [x, 2], [y, 2]
