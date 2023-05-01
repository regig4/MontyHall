import random

def experiment(n) -> int:
    win_count = 0

    for i in range(n):
        prize = random.randint(0, 2)
        choice = random.randint(0, 2)
        if choice == prize: 
            win_count += 1
    
    return win_count

def experiment2(n) -> int:
    win_count = 0
    
    for i in range(n):
        prize = random.randint(0, 2)
        choice = random.randint(0, 2)
        
        possible = []

        if choice == prize:
            possible = [choice, *filter(lambda x: x != choice, [0,1,2])]
        else: 
            possible = [prize, choice]

        choice = random.choices(possible)[0]
        
        if choice == prize:
            win_count += 1
            

    return win_count

if __name__ == "__main__":
    count = 1000000
    win_count = experiment(count)
    print(f"experiment #1 probability: {win_count * 100 / count}")
    win_count2 = experiment2(count)
    print(f"experiment #2 probability: {win_count2 * 100 / count}")
