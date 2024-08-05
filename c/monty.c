#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

uint32_t Experiment(uint32_t n)
{
    uint32_t winCount = 0;

    for (size_t i; i < n; i++)
    {
        uint32_t prize = rand() % 3;
        uint32_t choice = rand() % 3;

        if (choice == prize)
        {
            winCount++;
        }
    }
    return winCount;
}

uint32_t Experiment2(uint32_t n)
{
    uint32_t winCount = 0;

    for (size_t i = 0; i < n; i++)
    {
        uint32_t prize = rand() % 3;
        uint32_t choice = rand() % 3;

        short *possible;
        int possibleCount;

        if (choice == prize)
        {
            possibleCount = 3;
            possible = malloc(sizeof(short) * possibleCount);
            for (int j = 0; j < possibleCount; j++)
            {
                possible[j] = j;
            }
        }
        else
        {
            possibleCount = 2;
            possible = malloc(sizeof(short) * possibleCount);
            possible[0] = choice;
            possible[1] = prize;
        }

        choice = possible[rand() % possibleCount];

        if (choice == prize)
        {
            winCount++;
        }
    }

    return winCount;
}

int main(void)
{
    time_t tt;
    int seed = time(&tt);
    srand(seed);

    const uint32_t count = 1000000;
    uint32_t winCount = Experiment(count);
    printf("experiment #1 probability: %d\n", winCount * 100 / count);
    uint32_t winCount2 = Experiment2(count);
    printf("experiment #2 probability: %d", winCount2 * 100 / count);

    return 0;
}