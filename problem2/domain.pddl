(define (domain carrier-environment)

  (:requirements 
    :strips :typing :equality :disjunctive-preconditions :negative-preconditions
  )

  (:types
    location person robot crate carrier stock - object
    food - crate
    medicine - crate
    pos depot - location
  )
  (:constants
    agent - robot
    d0 - depot
    s0 - stock
    cr - carrier
  )

  (:predicates
    (at ?c - crate ?l - location)
    (person_at ?p - person ?l - location)
    (agent_at ?r - robot ?l - location)
    (person_needs ?p - person ?c - crate)
    (attached ?cr - carrier ?c - crate)
    (inc ?s ?ss - stock)
    (dec ?s ?ss - stock)
    (has_stock ?cr - carrier ?s - stock)
    (carrier_at ?cr - carrier ?l - location)
    ; (empty ?cr)
  )

    (:action move_agent_to_depot
    :parameters (?initial - pos ?destination - depot ?r - robot ?cr - carrier)
    :precondition (and 
      (agent_at ?r ?initial)
      ; (not (= ?initial ?destination ))
      (carrier_at ?cr ?initial)
      (has_stock ?cr s0)
    )
    :effect (and
      (agent_at ?r ?destination)
      (not (agent_at ?r ?initial))
      (carrier_at ?cr ?destination)
      (not (carrier_at ?cr ?initial))
    )
  ) 

  (:action move_agent
    :parameters (?initial - location ?destination - pos ?r - robot ?cr - carrier)
    :precondition (and 
      (agent_at ?r ?initial)
      (not (= ?initial ?destination ))
      (carrier_at ?cr ?initial)
      (not (has_stock ?cr s0))
    )
    :effect (and
      (agent_at ?r ?destination)
      (not (agent_at ?r ?initial))
      (carrier_at ?cr ?destination)
      (not (carrier_at ?cr ?initial))
    )
  )

  (:action pick_up
    :parameters (?d - depot ?c - crate ?r - robot ?cr - carrier ?s ?ss - stock)
    :precondition(and
      (agent_at ?r ?d)
      (at ?c ?d)
      (not (attached ?cr ?c))
      (carrier_at ?cr ?d)
      (has_stock ?cr ?s)
      (inc ?s ?ss)
    )
    :effect (and
      (not (at ?c ?d))
      (attached ?cr ?c )
      (has_stock ?cr ?ss)
      (not (has_stock ?cr ?s))
    )
  )

  (:action deliver
    :parameters (?l - pos ?c - crate ?r - robot ?p - person ?cr - carrier ?s ?ss - stock)
    :precondition (and 
      (not (person_needs ?p ?c))
      (agent_at ?r ?l)
      (attached ?cr ?c)
      (person_at ?p ?l)
      (carrier_at ?cr ?l)
      (has_stock ?cr ?s)
      (dec ?s ?ss)
    )
    :effect (and 
      ; (at ?c ?l)
      (person_needs ?p ?c)
      (not (attached ?cr ?c))
      (has_stock ?cr ?ss)
      (not (has_stock ?cr ?s))
      ; (agent_at ?r ?l)
    )
  )

)
