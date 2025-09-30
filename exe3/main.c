#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>

static void swap(int *a, int *b){
    int tmp = *a;
    *a = *b;
    *b = tmp;
}

int median(int a, int b, int c) {
    if (a > b) 
    {
        if (b > c) {
            return b;   
        }
        else if (a > c) {
            return c;
        }
        else {
            return a;
        }
    }else{
        if (a > c) {
            return a;
        }
        else if (b > c) {
            return c;
        }
        else {
            return b;
        }
    }
}


int partition (int* vec, int inf, int sup) {
	int meio = (inf + sup)/2;
    int i = inf;
	int j = sup;

    int pivo = median(vec[inf], vec[meio], vec[sup]);
	
	while (i <= j) {
		while (vec[i] < pivo) {
          ++i;
        }
		while (vec[j] > pivo) {
            --j;
        }


		if (i <= j) {
			swap (&vec[i], &vec[j]);
			++i;
			--j;
		}
	}

	return i;
}

void quick_sort (int* A, int size) {
    int inf = 0;
    int sup = size - 1;
	int* stack = (int *)malloc( (size) * sizeof(int));

	int top = -1;

	stack[++top] = inf;
	stack[++top] = sup;

	while (top >= 0) {
		sup = stack[top--];
		inf = stack[top--];
		
		int part = partition(A, inf, sup);

		if (part - 1 > inf) {
			stack[++top] = inf;
			stack[++top] = part - 1;
		}

		if (part < sup) {
			stack[++top] = part;
			stack[++top] = sup;
		}
	}

	free(stack);
}

void merge(int *A, int start, int middle, int end, int *B){
    int i = start;
    int j = middle;                  

    for(int k = start; k < end; ++k){
        if(i < middle && (j >= end || A[i] <= A[j])){
            B[k] = A[i];
            ++i;
        }else{
            B[k] = A[j];
            ++j;
        }
    }

    for(int k = start; k < end; ++k) {
        A[k] = B[k];
    }
}

void merge_sort(int *A, int size){
    int *B = (int *)malloc(size * sizeof(int));

    for(int i = 0; i < size; ++i) {
        B[i] = A[i];
    }

    for(int i = 2; i < size*2; i *=2){
        int middle = 0;
        int end = 0;

        for(int j = 0; j < size; j += i){
            end = j+i;
            middle = (j + end)/2;
            if(end > size) end -= end-size;      

            merge(A, j, middle, end, B);
        }
    }

    free(B); B = NULL; 
}

void build_max_heap(int* A, int size) {
    for (int i = 0; i < size; ++i) {
        int child = i + 1;

        while (child > 0) {
            if (A[child/2] < A[child]) {
                swap(&A[child], &A[child/2]);
                child /= 2;
            }else {
                break;
            }
        }
    }
}

void sieve(int* A, int size) {
    int parent = 0;
    int child = 1;
    int top_heap = A[0];

    while (child <= size) {
        if ( child < size) {
            if (A[child] < A[child + 1]) {
                ++child;
            }else{
            }
        }

        if (top_heap >= A[child]) 
            break;

        A[parent] = A[child];
        parent = child;
        child = 2*parent;    

    }

    A[parent] = top_heap;
}



void heap_sort(int* A, int size) {
    build_max_heap(A, size - 1);

    for (int m = size - 1; m >= 1; --m) {
        swap(&A[0], &A[m]);
        sieve(A, m - 1);
    }
}

#define tam_vetor 1000000

int* ler_vetor() {
    int* a = (int*)malloc(sizeof(int) * tam_vetor);
    for (unsigned i = 0; i < tam_vetor; ++i) {
        scanf("%d", &a[i]);
    }
    return a;
}

int main(int argc, char** argv) {
    int* vetor = ler_vetor();

    if (argv[1][0] == '0') {
        quick_sort(vetor, tam_vetor);
    } else if (argv[1][0] == '1') {
        merge_sort(vetor, tam_vetor);
    } else if (argv[1][0] == '2') {
        heap_sort(vetor, tam_vetor);
    }
}