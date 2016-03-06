#include <stdio.h>
#include <stdbool.h>

bool odd(unsigned int n);

bool even(unsigned int n) {
	if (n == 0) {
		return true;
	} else {
		return odd(n - 1);
	}
}

bool odd(unsigned int n) {
	if (n == 0) {
		return false;
	} else {
		return even(n - 1);
	}
}

int main(int argc, char** argv) {
	printf("Even(10) = %s\n", even(10) ? "true" : "false");
	printf("Odd(5) = %s\n", odd(5) ? "true" : "false");
	printf("Odd(6) = %s\n", odd(6) ? "true" : "false");
	return 0;
}