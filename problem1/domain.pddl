(define (domain crate-environment)

  (:requirements 
    :strips :typing :equality :disjunctive-preconditions :negative-preconditions
  )

  (:types
    location person robot crate - object
    food - crate
    medicine - crate
  )
  (:constants
    agent - robot
  )

  (:predicates
    (at ?c - crate ?l - location)
    (person_at ?p - person ?l - location)
    (agent_at ?r - robot ?l - location)
    ; (loaded ?r - robot ?c - crate)
    (person_needs ?p - person ?c - crate)
    (empty ?r - robot)
    (attached ?r - robot ?c - crate)	
  ) 

  (:action move_agent
    :parameters (?initial ?destination - location ?r - robot)
    :precondition (and 
      (agent_at ?r ?initial)
      (not (= ?initial ?destination ))
    )
    :effect (and
      (agent_at ?r ?destination)
      (not (agent_at ?r ?initial))
    )
  )

  (:action pick_up
    :parameters (?l - location ?c - crate ?r - robot)
    :precondition(and
      (empty ?r)
      (agent_at ?r ?l)
      (at ?c ?l)
      (not (attached ?r ?c))
    )
    :effect (and
      (not (empty ?r))
      (not (at ?c ?l))
      (attached ?r ?c )
    )
  )

  (:action deliver
    :parameters (?l - location ?c - crate ?r - robot ?p - person)
    :precondition (and 
      (not (empty ?r))
      (not (person_needs ?p ?c))
      (agent_at ?r ?l)
      (attached ?r ?c)
      (person_at ?p ?l)
    )
    :effect (and 
      (empty ?r)
      ; (at ?c ?l)
      (person_needs ?p ?c)
      (not (attached ?r ?c))
      ; (agent_at ?r ?l)
    )
  )

)
