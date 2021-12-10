#include <stdio.h>

int main(int argc, char* argv[]){
	int a, b;
	int counter = 0;
	scanf("%d", &a);
	int ref = a;
	int last = a;
	while (scanf("%d", &b) != EOF) {
		if (b < last) {
			ref = b;
		}
		if (b > ref) {
			counter++;
		}
		last = b;
	}
	printf("%d\n", counter);
	return 0;
}
