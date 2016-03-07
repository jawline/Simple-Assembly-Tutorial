#include <stdio.h>
#include <stdbool.h>

struct Apple {
	unsigned int massUnits;
	unsigned int caloriesPerMassUnit;
};

struct Apple makeApple(unsigned int mass, unsigned int cal) {
	struct Apple a;
	a.massUnits = mass;
	a.caloriesPerMassUnit = cal;
	return a;
}

unsigned int calculateTotalCals(struct Apple* apple) {
	return apple->massUnits * apple->caloriesPerMassUnit;
}

void printAppleInfo(struct Apple* apple) {
	printf("Apple mass units: %i\n", apple->massUnits);
	printf("Apple Calories per unit: %i\n", apple->caloriesPerMassUnit);
	printf("Total Cals: %i\n", calculateTotalCals(apple));
}

int main(int argc, char** argv) {
	
	struct Apple a = makeApple(150, 2);
	printAppleInfo(&a);

	return 0;
}