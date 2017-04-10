# AI Planning, A Historical Overview
Bharanidharan (Barni) S, April 2017

## Goals
1. Provide a historical overview of the developments in the field of AI Planning and Search
2. Select 3 important developments and describe the impact on the field of AI
3. Present the report as research_review.pdf

## Overview
The overall techniques in Planning are

- State Space Search
- Plan Space Search
- Linear PLanning
- Partial Ordered Planning (non-linear)
- Graph Plan
- SAT 
- Symbolic Search
- Temporal Planners

### Timeline
Some of the documents as gathered from the Russel, Norvig text and other sources.

|year|topic|authors|advancement|notes|
|---|---|---|---|---|
|1961|Linear||General Problem Solver (GPS)||
|1963|Linear|John McCarthy|Situational Calculus|The situation calculus approach to planning was introduced|
|1971|Representation||STRIPS||
|1974|Linear|Warren|WARPLAN||
|1975|Linear||result:  Linear Planning is incomplete||
|1975|Linear|Waldinger|Interleaving achieved via goal-regression planning|||1975|POP|Tate|Detection of conflicts||
|1975|POP|Sussman|Protection of achieved conditions from interference||
|1977|POP|Sacerdoti|NOAH Planner|Pioneered construction of POP (aka task networks)|
|1977|POP|Tate|NONLIN Planner||
|1986|Representation||Action Description Language (ADL)||
|1987|POP||Searializable subgoals||
|1987|POP|Chapman|Formal Exposition of POP with TWEAK Planner|Proof of completeness and intractability|||1990|Survey|Allen|Readings in Planning|Comprehensive anthology of early work in the field||1991|POP|McAllester and Rosenblitt|Complete partial order planner||
|1991|POP|Soderland and Weld|SNLP Planner|widely distributed|
|1992|POP|Penberthy and Weld|UCPOP Planner||
|1992|Representation||result: STRIPS is PSPACE-complete||
|1992|SAT|Kautz, Selman|Planning as satisfiability|Proc. ECAI-92, Vienna, Austria, 359–363|
|1994|Graph Planning|Ghallab, Laruelle|IXTET partial-order planner used it to derive accurate heuristics to guide searches|Data structure closely resembling the planning graph|
|1996|State Space|Drew McDermott|UNPOP program|First to suggest the ignore-delete-list heuristic|
|1997|Graph Plan|Avrim Blum, Merrick Furst|GRAPHPLAN|Revitalized the field of planning with their GRAPHPLAN system, which was orders of magnitude faster than the partial-order planners of the time|
|1997|Representation|Ernst||Automatic “compiler” for generating propositional representations from PDDL problems||1997|Graph Planning|Koehler|IPP|||1998|Binary Decision|Cimatti|Planner based on Binary Decision Diagrams||
|1998|Graph Planning|Fox,Long|STAN||
|1998|Graph Planning|Weld|SGP||
|1998|Graph Planning|Kautz,Selman|BLACKBOX planner|Combines ideas from GRAPHPLAN and SATPLAN|
|1998|Representation||PDDL||
|1994,1999|Survey|Weld|Provides two excellent surveys of planning algorithms of the 1990s. It is interesting to see the change in the five years between the two surveys: the first concentrates on partial-order planning, and the second introduces GRAPHPLAN and SATPLAN.|
|1999|Constraint|van Beek|CPLAN|Based on constraint satisfaction|
|1999-2006|State Space|Bonet and Geffner, Haslum|Heuristic Search Planner HSP|Made state-space search practical for large planning problems, HSP searches in the forward direction|
|1999|State Space|Bonet and Geffner|HSPR|searches backward|
|2000|Representation||ADL to STRIPS compiling||
|2001|POP|Nguyen and Kambhampati|REPOP Planner (scales better than GRAPHPLAN in parallelizable domains), Uses accurate heuristics derived from a planning graph||
|2001, 2005|State Space|Hoffman, Nebel|FF|The most successful state-space searcher, winner of the AIPS 2000 planning competition|
|2001|General|Vosse||survey the use of integer programming for planning|
|2001|Analysis|Nguyen||thoroughly analyze heuristics derived from planning graphs.|
|2001|Survey|Helmert||Analyzes several classes of planning problems, and shows that constraint-based approaches such as GRAPHPLAN and SATPLAN are best for NP-hard domains, while search-based approaches do better in domains where feasible solutions can be found without backtracking.  GRAPHPLAN and SATPLAN have trouble in domains with many objects because that means they must create many actions. In some cases the problem can be delayed or avoided by generating the propositionalized actions dynamically, only as needed, rather than instantiating them all before the search begins.|
|2002|Planning graph|Gerevini, Serina|LPG|searched planning graphs using a local search technique inspired by WALKSAT. The winner of the 2002 AIPS planning competition.|
|1994, 2004|Analysis|Bylander, Ghallab||discuss the computational complexity of several variants of the planning problem|
|2003|Analysis|Helmert||proves complexity bounds for many of the standard benchmark problems|
|2004|Textbooks|Ghallab|Automated Planning|An excellent textbook on all aspects of planning|
|2005|Analysis|Hoffmann||analyzes the search space of the ignore-delete-list heuristic|
|2006|Textbooks|LaValle|Planning Algorithms|Covers classical and stochastic planning, with extensive coverage of robot motion planning||2006|State Space|Helmert, Ritcher|FASTDOWNWARD|Forward state-space search planner that preprocesses the action schemas into an alternative representation which makes some of the constraints more explicit. Won the 2004 planning competition|
|2008|State Space|Richter and Westphal|LAMA|Base'd on FASTDOWNWARD with improved heuristics, won the 2008 competition|
|2009|Analysis|Edelkamp, Haslum||Described how to construct pattern databases for planning heuristics|
## Important Developments

### Non-Linear Planning
Around 1975, Linear planning was discovered to be incomplete. It could not handle simple cases as described in Sussman Anamoly. Researchers explored Parial ordered planners (non-linear planning)for more efficient solutions. Partial Ordered Planners(POP) were proven to be complete. This technique are best suited for problems that could be decomposed into independent sub tasks. Using a least-commitment approach, multiple paths are explored in parallel. It can be implemented as a search of partially-ordered plans. Ordering constraints and causal links can be used to encode the plan. Some of the Non-linear plans:

* NOAH Planner(defined task networks)
* NONLIN Planner
* TWEAK Planner(Proof of completeness and intractability)
* SNLP Planner
* UCPOP Planner


Impact: Expanded the capability of AI planners to allow decomposability and solve problems that were not solvable by linear planners.

### GRAPHPLAN
Introduced by Blum, Furst in 1997, GRAPHPLAN outperformed the partial order planners of its day. The authors introduced the concept of a Planning Graph. Planning graph is constructed from the problem statements described in STRIPS (or PDDL). The planning graph encodes the problem in such a way that many useful constraints are explicitly available to reduce search space. Also the Planning Graph is not a state-space graph. A path in the Planning Graph is essentially a flow. The search combines aspects of both total and partial order planners. It guarantees the shortest path. It is a directed levelled graph with alternating levels of propositions and actions. Once the Planning Graph is constructed, a GRAPHPLAN algorithm is run on it to extract a valid plan.

Impact: Order of magnitude reduction in time taken to solve planning problems

### SATPLAN
Proposed in 1992 by Kautz, Selman in their paper "Planning as satisfiability", it was a new way to encode palnning problems. Soon compilers were developed to translate the STRIPS domain representation to a SAT domain representation, which was then solved using a Solver (systematic or stochastic). The basic representation is a function and quantifier free typed predicate logic. The problem is encoded as a schema which is conjunction of formulas. The advantage of such a system is tha any intermediate state constraints can be represented easily. Since the length of a theory is bounded by O(kc^d), where d is the number of quantifiers nesting in a schema (arguments to a predicate). Simple Action Splitting is used to reduce n-ary fluents (predicates) to unary predicates. Davis-Putman procedure (DP) or GSAT (randomized local search) procedure is used for solving. 

Impact: Provided a new way of modelling planning problems as SAT problems to use existing SAT solvers to find solutions. It moved from deduction formalized planning to first order propositional satisfiability. 

### Temporal Planning
Recently temporal planning explores AI planning in real world time domain, instead of time-steps as used by planners. Problems are representing using temporal extensions to PDDL or using NDL. The problem domain is reduced to SMT (Satisfiability Modulo Theories) and then solved.


## References
1. Artificial Intelligence: A Modern Approach by Norvig and Russel, Chapter 10, Bibliographical and Historical Notes
2. Jussi Rintanen, https://users.ics.aalto.fi/rintanen/planning.html
3. https://aitopics.org/misc/brief-history
4. https://www.reddit.com/r/artificial/comments/1yupjk/what_happened_to_planning/?
5. http://www.cs.cornell.edu/selman/papers/pdf/92.ecai.satplan.pdf
6. https://users.ics.aalto.fi/rintanen/papers/Rintanen14IPC.pdf
7. https://www.reddit.com/r/artificial/comments/3g2z4c/whats_the_current_state_of_ai_planning/
8. https://users.ics.aalto.fi/rintanen/ecai14tutorial/tutohandout-4up.pdf
9. http://www.cs.cmu.edu/~reids/planning/handouts/Comparison.pdf
10. http://homes.cs.washington.edu/%7Eweld/papers/pi2.pdf
11. https://people.cs.pitt.edu/~milos/courses/cs1571/Lectures/Class18a.pdf
12. http://www.cs.rochester.edu/u/kautz/papers/ijcai99blackbox.pdf
13. http://www.inf.ed.ac.uk/teaching/courses/plan/slides/Temporal-Planning-Slides.pdf
14. https://users.ics.aalto.fi/rintanen/temporalplanning.html




