(define (domain time-environment)

  (:requirements 
    :strips :typing :equality :durative-actions
  )

  (:types
    location person robot crate carrier stock typecrate- object
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
    (type_needs ?p - person ?t - typecrate)
    (type_not_needs ?p - person ?t - typecrate)
  )


    (:durative-action move_agent_to_depot
      :parameters (?initial - pos ?destination - depot ?r - robot ?cr - carrier)
      :duration (= ?duration 10)
      :condition (and
        (at start (agent_at ?r ?initial))
        (at start (carrier_at ?cr ?initial))
        (at start ( has_stock ?cr s0))
      )
      :effect (and
        (at start (not (agent_at ?r ?initial)))
        (at start (not (carrier_at ?cr ?initial)))
        (at end (agent_at ?r ?destination))
        (at end (carrier_at ?r ?destination))
      )
    )



    (:durative-action move_agent
      :parameters (?initial - location ?destination - pos ?r - robot ?cr - carrier)
      :duration (= ?duration 10)
      :condition (and
        (at start (agent_at ?r ?initial))
        (at start (carrier_at ?r ?initial))
        (over all (not (has_stock ?cr s0)))
      )
      :effect (and
        (at start (not (agent_at ?r ?initial)))
        (at start (not (carrier_at ?cr ?initial)))
        (at end (agent_at ?r ?destination))
        (at end (carrier_at ?cr ?destination))
      )

    )


    (:durative-action pick_up
      :parameters (?d - depot ?c - crate ?r - robot ?cr - carrier ?s ?ss - stock)
      :duration (= ?duration 5)
      :condition (and
        (at start (agent_at ?r ?d))
        (at start (at ?c ?d))
        (at start (carrier_at ?cr ?d))
        (at start (inc ?s ?ss))
        (at start (has_stock ?cr ?s))
        (at start (not (attached ?cr ?c)))
      )
      :effect (and
        (at start (not (at ?c ?d)))
        (at end (not (has_stock ?cr ?s)))
        (at end (attached ?cr ?c))
        (at end (has_stock ?cr ?ss))
      )
    )


    (:durative-action deliver
      :parameters (?l - pos ?c - crate ?r - robot ?p - person ?cr - carrier ?s ?ss - stock)
      :duration (= ?duration 3)
      :condition (and
        (at start (not (person_needs ?p ?c)))
        (at start (agent_at ?r ?l))
        (at start (attached ?cr ?c))
        (at start (person_at ?p ?l))
        (at start (carrier_at ?cr ?l))
        (at start (has_stock ?cr ?s))
        (at start (dec ?s ?ss))

      )
      :effect (and
        (at end (person_needs ?p ?c))
        (at end (not (attached ?cr ?c)))
        (at end (not (has_stock ?cr ?s)))
        (at end (has_stock ?cr ?ss))
      )
    )

)
