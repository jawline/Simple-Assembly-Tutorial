#include <stdio.h>

int mul(int a, int b) {
	return a * b;
}

int main(int argc, char** argv) {
	int a = 5, b = 10;
	printf("Mul A B %i\n", mul(a,b));
	return 0;
}