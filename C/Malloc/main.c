#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv) {

	int* array = malloc(sizeof(int) * 10);

	for (unsigned int i = 0; i < 10; i++) {
		array[i] = i;
	}

	int count = 0;

	for (unsigned int i = 0; i < 10; i++) {
		count += array[i];
	}

	printf("Final Count: %i\n", count);

	return 0;
}