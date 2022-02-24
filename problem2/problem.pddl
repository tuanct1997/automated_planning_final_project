(define (problem problem2)
	
  (:domain carrier-environment)

  (:objects
    loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 loc9 loc10 loc11 - pos
    f1 f2 f3 - food
    m1 m2 m3 - medicine
    tuan isa bella sara - person
    s1 s2 s3 s4 - stock
    agent1 - robot
    cr1 - carrier
    ; cr - carrier

  )

  (:init
    (at f1 d0) (at f2 d0) (at f3 d0) (at m1 d0) (at m2 d0) (at m3 d0)
    (person_at tuan loc5) (person_at isa loc6) (person_at kalem loc1) (person_at bella loc2)(person_at sara loc8)
    (agent_at agent d0) (agent_at agent1 d0)
    (carrier_at cr d0) (carrier_at cr1 d0)
    (has_stock cr s0)
    (inc s0 s1) (inc s1 s2) (inc s2 s3) (inc s3 s4) (dec s4 s3) (dec s3 s2) (dec s2 s1) (dec s1 s0)

    
  ) 

  (:goal(and
  	(or (person_needs tuan f1) (person_needs tuan f2) (person_needs tuan f3) )
  	(or (person_needs tuan m1) (person_needs tuan m2) (person_needs tuan m3) )

  	(or (person_needs isa f1) (person_needs isa f2) (person_needs isa f3) )

  	(or (person_needs bella m1) (person_needs bella m2) (person_needs bella m3) )

  	(not (or (person_needs sara f1) (person_needs sara f2) (person_needs sara f3) ))
  	(not (or (person_needs sara m1) (person_needs sara m2) (person_needs sara m3) ))

  	; (or (person_needs chi f1) (person_needs chi f2) (person_needs chi f3) (person_needs chi f4) (person_needs chi f5))

  )

  ))