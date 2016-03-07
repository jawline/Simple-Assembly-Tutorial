#include <stdio.h>
#include <stdbool.h>

void makeTrue(bool* ptr) {
	*ptr = true;
}

void makeFalse(bool* ptr) {
	*ptr = false;
}

void doubleVal(int* val) {
	*val = *val * 2;
}

void setB(int* b, int v) {
	*b = v;
}

void printA(bool* a) {
	printf("A: %s\n", *a ? "true" : "false");
}

void printB(int* b) {
	printf("B: %i\n", *b);
}

int main(int argc, char** argv) {
	bool a;
	int b;

	makeTrue(&a);
	printA(&a);
	makeFalse(&a);
	printA(&a);

	printB(&b);
	setB(&b, 150);
	printB(&b);
	doubleVal(&b);
	printB(&b);

	return 0;
}