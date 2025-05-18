def read_input():
    V = int(input())
    E = int(input())
    m = int(input())
    edges = [tuple(map(int, input().split())) for _ in range(E)]
    return V, E, m, edges

def main():
    V, E, m, edges = read_input()
    if E==0 or m >= V:
        print(3)        
        print(2)       
        print(3)       
        print(1, 1)
        print(1, 2)
        print(1, 3)
        print(2, 1, 3) 
        print(2, 3, 2)
        return

    degree = [0] * V
    for u, v in edges:
        degree[u - 1] += 1
        degree[v - 1] += 1

    roles = [[] for _ in range(V)]
    for i in range(V):
        roles[i] = list(range(3, m + 3))
    roles.append([1])
    roles.append([2])

    scenes = []
    for u, v in edges:
        scenes.append((u, v))

    toggle = True
    for i in range(V):
        if degree[i] == 0:
            if toggle:
                scenes.append((i + 1, V + 1))
            else:
                scenes.append((i + 1, V + 2))
            toggle = not toggle

    used_roles = set()
    for u, v in scenes:
        used_roles.add(u)
        used_roles.add(v)
    if V + 1 not in used_roles:
        scenes.append((V + 1, 1))
    if V + 2 not in used_roles:
        scenes.append((V + 2, 1))

    n = V + 2
    s = len(scenes)
    k = m + 2

    print(n)
    print(s)
    print(k)
    for allowed in roles:
        print(len(allowed), *allowed)
    for u, v in scenes:
        print(2, u, v)

if __name__ == '__main__':
    main()
