# Theory Exercises

1.  **Write, in some notation of your choice, a solution to the yes-instance of the casting problem in the example above.**

2.  **Show that the casting problem is in NP.**
    Allowed‐set check
    For each role r, verify that the proposed actor f(r) is in the allowed list for r.

    No‐same‐actor‐in‐scene check
    For each scene s (which is a set of roles), confirm that all roles in s are mapped to pairwise‐distinct actors.

    No‐both‐divas‐in‐same‐scene check
    For each scene s, ensure it is not the case that two roles in s are assigned actor 1 and actor 2 simultaneously.

    All three can be done in time polynomial in |R|+|S| (and in the size of each scene). Concretely:

    As you scan the roles 1…n to check “f(r) ∈ Allowed(r),” keep a boolean array or hash‐set of which actor IDs are divas (here {1,2}).

    Then, for each scene s = {r₁, r₂, …, r_k}, build a small set “assigned = {f(r₁),…,f(r_k)}.”

    If |assigned| < k, you’ve detected “two roles in the same scene share the same actor” (fail).

    Also check “{1,2} ⊄ assigned” (i.e.\ it’s not true that both 1∈assigned and 2∈assigned). If both diva IDs appear, that scene fails.

3.  **Suppose we want to modify the no-instance above into a yes-instance, by adding a few actors. How many actors do we need to add in this case? (Assume every actor we add can play every role.)**
    A quick check (either by hand or by enumerating all 3⁵ possible assignments) confirms that every partial assignment eventually forces a conflict in scene 3 or scene 5. Concretely:

    Role 4 must be played by actor 2 (because Role 4’s allowed set = {2} only).

    In Scene 3 = {Role 1, Role 3, Role 4}, Role 4 is already “2,” so Roles 1 and 3 must choose distinct actors from {1, 3}.

    But in Scene 5 = {Role 2, Role 3, Role 5}, Role 3 has just been assigned something in {1, 3}, so Role 2 must choose from {2, 3}, and Role 5 from {1, 2, 3}, etc.

    One checks that inevitably two roles collide. (Numerically, you can loop over all ⁠3⁵ = 243 assignments and see none is valid.)

    Hence with k = 3 actors strictly following the given “allowed” lists, no valid casting exists.

    If we add one more actor then it works:
    Role 1 → Actor 1  
    Role 2 → Actor 2  
    Role 3 → Actor 3  
    Role 4 → Actor 4 ← (the single new actor!)  
    Role 5 → Actor 1

    Scene 1 = {1, 2} → (Actor 1, Actor 2) are distinct.
    Scene 2 = {2, 4} → (Actor 2, Actor 4) distinct.
    Scene 3 = {1, 3, 4} → (1, 3, 4) are all distinct.
    Scene 4 = {3, 5} → (3, 1) are distinct.
    Scene 5 = {2, 3, 5} → (2, 3, 1) all distinct.

4.  **Which is the smallest possible production that satisfies all input constraints for the casting problem and is possible to stage (i.e., the smallest possible YES-instance)? Specify the input for this production.**

    n = 2 # two roles: r₁, r₂  
    s = 1 # one scene  
    k = 2 # two actors: a₁, a₂

    Role‐allowed lists:  
     r₁ → { a₁ }  
     r₂ → { a₂ }

    Scenes:  
     Scene₁ = { r₁, r₂ }

5.  **Imagine an instance with 3 or more roles, where the roles can be divided into two groups, such that each role never occurs in a scene together with another role from the same group. In other words the scenes and roles has a structure similar to a bipartite graph. Suppose further that every actor can play every role. How many actors will be sufficient in this case?**

    The roles form two sets (L and R'), and every scene contains one role from L and one from R′.

    That means roles in the same group never appear together.

    It is like a bipartite graph where:

        Roles = nodes
        Scenes = edges between nodes
        Edges only connect nodes from different sets (L and R′)

    you can satisfy both the diva constraint (actors 1 and 2 never in the same scene but both used)
    and the casting constraint (one actor per role per scene) using only 3 actors and 4 roles in a bipartite role structure.
    By assigning each diva to a role in different groups and using a third actor to cover the remaining roles,
    you can create scenes between the two role groups without conflict.

6.  **Suppose that an instance A contains a scene with the roles 4, 7 and 12, while the instance B has three scenes with the roles 4 and 7, 7 and 12, 4 and 12. If all other constraints are identical between the instances, will the solutions be identical? Why/why not?**

    Instance A has a single scene
    {4, 7, 12} (a 3‐role “triple” scene).

    Instance B has three scenes (all 2‐role each):
    {4, 7}

        {7, 12}

        {4, 12}
