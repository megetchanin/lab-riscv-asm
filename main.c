#include <stdio.h>

#define N 4
#define M 6

void process(int n, int m, int matrix [M][N], int result)
{
    result = 0;
    int min_sum = 0;
    int sum = 0;
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < m; ++j) 
        {
            sum += matrix[m][n];
        }
        if (n > 0){
            if (sum < min_sum){
                min_sum = sum;
                result = n;
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

    process(N, M, matrix, result);

    for (int i = 0; i < M; ++i) {
        printf("%d ", result);
    }

    return 0;
}