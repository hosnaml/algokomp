def main():
    n = int(input())  # Number of roles
    s = int(input())  # Number of scenes
    k = int(input())  # Number of actors

    #constraints 1
    role_to_actors = {}
    for i in range(n):
        inp = input()
        parts = inp.split()
        num_actors = int(parts[0])
        actors = [int(parts[j]) for j in range(1, num_actors + 1)]
        role_to_actors[i + 1] = actors 

    #constraints 2 
    scene_to_roles = {}
    for i in range(s):
        inp = input()
        parts = inp.split()
        num_roles = int(parts[0])
        roles = [int(parts[j]) for j in range(1, num_roles + 1)]
        scene_to_roles[i + 1] = roles

    vertices = []
    for role in range(1, n + 1):
        for actor in role_to_actors[role]:
            vertices.append((role, actor))

    vertices.append((0, 0)) 
    vertex_to_index = {vertex: i + 1 for i, vertex in enumerate(vertices)}
    num_vertices = len(vertices)

    edges = []

    for actor in role_to_actors[1]:
        edges.append((vertex_to_index[(0, 0)], vertex_to_index[(1, actor)]))

    for actor in role_to_actors[n]:
        edges.append((vertex_to_index[(n, actor)], vertex_to_index[(0, 0)]))

    for role in range(1, n):
        for actor1 in role_to_actors[role]:
            for actor2 in role_to_actors[role + 1]:
                
                compatible = True
                for scene_roles in scene_to_roles.values():
                    
                    if role in scene_roles and role + 1 in scene_roles and actor1 == actor2:
                        compatible = False
                        break
                    
                    if (actor1 == 1 and actor2 == 2) or (actor1 == 2 and actor2 == 1):
                        roles_in_scene = set(scene_roles)
                        if role in roles_in_scene and role + 1 in roles_in_scene:
                            compatible = False
                            break
                
                if compatible:
                    edges.append((vertex_to_index[(role, actor1)], vertex_to_index[(role + 1, actor2)]))

    print(num_vertices)  
    print(len(edges))    
    for edge in edges:
        print(f"{edge[0]} {edge[1]}")

if __name__ == "__main__":
    main()

