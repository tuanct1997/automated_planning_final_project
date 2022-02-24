# PlanSys2 Simple Example

## Description

This project is based on example which is provided by professor **Marco Roveri**.

## How to run

In terminal 1:

```
ros2 launch plansys2_simple_example plansys2_simple_example_launch.py
```

In terminal 2:

```
ros2 run plansys2_terminal plansys2_terminal        # enters in PlanSys2 Terminal
set instance agent robot
set instance cr carrier
set instance s0 stock
set instance s1 stock
set instance s2 stock
set instance s3 stock
set instance s4 stock
set instance d0 depot
set instance loc1 pos
set instance loc2 pos
set instance loc3 pos
set instance loc4 pos
set instance loc5 pos
set instance loc6 pos
set instance loc7 pos
set instance loc8 pos
set instance loc9 pos
set instance loc10 pos
set instance loc11 pos
set instance f1 crate
set instance f2 crate
set instance f3 crate
set instance f4 crate
set instance f5 crate
set instance f6 crate
set instance tuan person
set instance isa person
set instance bella person
set instance sara person
set instance food typecrate
set instance medicine typecrate

get problem instances

set predicate (at f1 d0)
set predicate (at f2 d0)
set predicate (at f3 d0)
set predicate (at f4 d0)
set predicate (at f5 d0)
set predicate (at f6 d0)

set predicate (person_at tuan loc5)
set predicate (person_at isa loc6)
set predicate (person_at bella loc2)
set predicate (person_at sara loc8)

set predicate (agent_at agent d0)

set predicate (carrier_at cr d0)

set predicate (has_stock cr s0)

set predicate (inc s0 s1)
set predicate (inc s1 s2)
set predicate (inc s2 s3)
set predicate (inc s3 s4)
set predicate (dec s4 s3)
set predicate (dec s3 s2)
set predicate (dec s2 s1)
set predicate (dec s1 s0)

set predicate (free cr)
set predicate (type_needs tuan food)
set predicate (type_needs tuan medicine)
set predicate (type_needs isa food)
set predicate (type_needs bella medicine)
set predicate (type_not_needs isa medicine)
set predicate (type_not_needs bella food)
set predicate (type_not_needs sara food)
set predicate (type_not_needs sara medicine)

set predicate (crate_type f1 food)
set predicate (crate_type f2 food)
set predicate (crate_type f3 food)
set predicate (crate_type f4 medicine)
set predicate (crate_type f5 medicine)
set predicate (crate_type f6 medicine)

get problem predicates

set goal (and(type_not_needs tuan food) (type_not_needs tuan medicine) (type_not_needs isa food) (type_not_needs isa medicine) (type_not_needs bella food) (type_not_needs bella medicine) (type_not_needs sara food) (type_not_needs sara medicine))

get plan
run

```
