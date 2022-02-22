(define (problem problem1)
	
  (:domain crate-environment)

  (:objects
    depot loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 loc9 loc10 loc11 - location
    f1 f2 f3 - food
    m1 m2 m3 - medicine
    tuan kalem isa bella sara - person

  )

  (:init
    (at f1 depot) (at f2 depot) (at f3 depot)(at m1 depot) (at m2 depot) (at m3 depot)
    (person_at tuan loc5) (person_at isa loc6) (person_at kalem loc1) (person_at bella loc2)(person_at sara loc8)
    (agent_at agent depot)
    (empty agent)
    
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