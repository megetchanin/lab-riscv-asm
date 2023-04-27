#include <stdio.h>

#define N 4
#define M 6

void process(int n, int m, int matrix [M][N], int* result)
{
    *result = 0;
    int min_sum = 0;
    for (int i = 0; i < n; ++i) {
        int sum = 0;
        for (int j = 0; j < m; ++j) 
        {
            sum += matrix[j][i];
        }
        if (i > 0){
            if (sum < min_sum){
                min_sum = sum;
                *result = i;
            }
        }
        else
        {
            min_sum=sum;
        }
    }

}

int main(int argc, char** argv)
{
    int matrix[M][N];
    int result;
    
    for (int i = 0; i < M; ++i) {
        for (int j = 0; j < N; ++j) {
            scanf("%d", &matrix[i][j]);
        }
    }

    process(N, M, matrix, &result);

    printf("%d\n", result);

    return 0;
}