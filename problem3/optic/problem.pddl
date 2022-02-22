(define (problem problem3)
  
  (:domain time-environment)

  (:objects
    loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 loc9 loc10 loc11 - pos
    f1 f2 f3 f4 f5 f6 - crate
    tuan isa bella sara - person
    s1 s2 s3 s4 - stock
    food medicine - typecrate
    ; cr - carrier

  )

  (:init
    (at f1 d0) (at f2 d0) (at f3 d0) (at f4 d0) (at f5 d0) (at f6 d0)
    (person_at tuan loc5) (person_at isa loc6) (person_at bella loc2)(person_at sara loc8)
    (agent_at agent d0)
    (carrier_at cr d0)
    (has_stock cr s0)
    (inc s0 s1) (inc s1 s2) (inc s2 s3) (inc s3 s4) (dec s4 s3) (dec s3 s2) (dec s2 s1) (dec s1 s0)
    (free cr)
    (type_needs tuan food) (type_needs tuan medicine)
    (type_needs isa food) (type_not_needs isa medicine)
    (type_needs bella medicine) (type_not_needs bella food)
    (type_not_needs sara food) (type_not_needs sara medicine)
    (crate_type f1 food) (crate_type f2 food) (crate_type f3 food) (crate_type f4 medicine) (crate_type f5 medicine) (crate_type f6 medicine)


    
  ) 

  (:goal(and
    (type_not_needs tuan food) (type_not_needs tuan medicine)
    (type_not_needs sara food) (type_not_needs sara medicine)
    (type_not_needs isa food) (type_not_needs isa medicine)
    (type_not_needs bella food) (type_not_needs bella medicine)

  )

  )
(:metric minimize (total-time))
)