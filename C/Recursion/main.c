#include <stdio.h>

int fact(unsigned int n) {
	if (n == 1) {
		return 1;
	} else {
		return n;
	}
}

int main(int argc, char** argv) {
	printf("Fact(5) = %i\n", fact(5));
	return 0;
}