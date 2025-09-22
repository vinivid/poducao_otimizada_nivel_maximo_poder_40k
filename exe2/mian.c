#include <stdlib.h>
#include <stdio.h>
#include <time.h>

void make_random(int* mat, int n) {
    for (int i = 0; i < n * n; ++i) {
        mat[i] = rand();
    }
}

void init_zero(int* mat, int n) {
    for (int i = 0; i < n; ++i) {
        mat[i] = 0;
    }
}

void mult_normal(const int* A, const int* B, int* dest, int n) {
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            for (int k = 0; k < n; ++k) {
                dest[i * n + j] += A[i * n + k] * B[k * n + j];
            }
        }
    }
}

void loop_interchange(int* A, int* B, int* dest, int n){
    for(int i=0; i<n; i++){
        for(int k=0; k<n; k++){
            for(int j=0; j<n; j++){
                dest[(i*n)+j] += A[(i*n)+k] * B[(k*n)+j];
            }
        }
    }
}

void loop_unrolling(int* A, int* B, int* dest, int n) {
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            for (int k = 0; k < n; k += 10) {
                dest[(i*n)+j] += A[(i*n)+k] * B[(k * n)+j];
                dest[(i*n)+j] += A[(i * n) + (k + 1)] * B[((k + 1) * n) +j];
                dest[(i*n)+j] += A[(i * n) + (k + 2)] * B[((k + 2) * n) +j];
                dest[(i*n)+j] += A[(i * n) + (k + 3)] * B[((k + 3) * n) +j];
                dest[(i*n)+j] += A[(i * n) + (k + 4)] * B[((k + 4) * n) +j];
                dest[(i*n)+j] += A[(i * n) + (k + 5)] * B[((k + 5) * n) +j];
                dest[(i*n)+j] += A[(i * n) + (k + 6)] * B[((k + 6) * n) +j];
                dest[(i*n)+j] += A[(i * n) + (k + 7)] * B[((k + 7) * n) +j];
                dest[(i*n)+j] += A[(i * n) + (k + 8)] * B[((k + 8) * n) +j];
                dest[(i*n)+j] += A[(i * n) + (k + 9)] * B[((k + 9) * n) +j];
            }
        }
    }
}

void loop_tiling(int* A, int* B, int* dest, int n){
    int const TILE_SIZE = 100;
    for(int x=0; x<n; x+=TILE_SIZE){
        for(int y=0; y<n; y+=TILE_SIZE){
            for(int z=0; z<n; z+=TILE_SIZE){
                for(int i=0; i<TILE_SIZE; i++){
                    for(int j=0; j<TILE_SIZE; j++){
                        for(int k=0; k<TILE_SIZE; k++){
                            dest[(i*n)+j] = A[(i*n)+k] * B[(k*n)+j];
                        }
                    }
                }
            }
        }
    }
}

void print_mat(int* mat, int n) {
    for (int i = 0; i < n; ++i) {
        printf("| ");
        for (int j = 0; j < n; ++j) {
            printf("%d ", mat[i * n + j]);
        }

        printf("|\n");
    }
}

int main(int argc, char** argv) {
    const int n = 820;

    // estatico
    if (argv[2][0] == '0') {
        #define N 820
        int A[N * N];
        int B[N * N];
        int dest[N * N];
        make_random(A, n);
        make_random(B, n);
        init_zero(dest, n);

        //clock_t start, stop;
        //start = clock();
        if (argv[1][0] == '0') {
            mult_normal(A, B, dest, n);
        } else if(argv[1][0] == '1') {
            loop_interchange(A, B, dest, n);
        } else if(argv[1][0] == '2') {
            loop_unrolling(A, B, dest, n);
        } else if(argv[1][0] == '3') {
            loop_tiling(A, B, dest, n);
        } else {
            printf("Argumento de metodo erroneo.");
        }
        //stop = clock();

        //printf("%f\n", (double)(stop - start) / CLOCKS_PER_SEC);
    } else { //dinamicao
        int* A = malloc(sizeof(int) * (n * n));
        int* B = malloc(sizeof(int) * (n * n));
        int* dest = calloc(sizeof(int), n * n);
        make_random(A, n);
        make_random(B, n);

        //clock_t start, stop;
        //start = clock();
        if (argv[1][0] == '0') {
            mult_normal(A, B, dest, n);
        } else if(argv[1][0] == '1') {
            loop_interchange(A, B, dest, n);
        } else if(argv[1][0] == '2') {
            loop_unrolling(A, B, dest, n);
        } else if(argv[1][0] == '3') {
            loop_tiling(A, B, dest, n);
        } else {
            printf("Argumento de metodo erroneo.");
        }
        //stop = clock();

        //printf("%f\n", (double)(stop - start) / CLOCKS_PER_SEC);
    }
}