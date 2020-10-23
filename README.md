An example of finding input region S such that a closed-loop system with a neural network controller maps S back to S.

to build Marabou and run the analysis, run

   `./run.sh`

This will create a partition of the input region. Each partition is stored as a file in ./dump.
The suffix "hold" means that an input region is an invariant according to the analysis.

The check whether an invariant ./dump/[region].hold is a real one, run

    `./verify_invariant.sh ./dump/[region].hold

This calls Marabou and check whether this is a true invariant.
More concretely, suppose the outputs of the network are y1 and y2, given an input region L <= X <= U, for each input dimension x,
we check whether the following queries are unsatisfiable:

   1. y1 >= y2 and x >= u
   2. y1 <= y2 and x >= u
   3. y1 >= y2 and x <= l
   4. y1 <= y2 and x <= l

In total, this amounts to 16 satisfiable checks since the network has 4 inputs.
If each query is unsatisiable (the solver prints out "DnCManager::solve UNSAT query"), the region is a real invariant.
