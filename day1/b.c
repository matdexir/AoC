#include <stdio.h>

int main(int argc, char* argv[]){
	int a, b, c; // The sliding window
	int d;
	int counter = 0;
	scanf("%d%d%d", &a, &b, &c);
	int sum_last = a + b + c;
	int sum_ref = a + b + c;
	while (scanf("%d", &d) != EOF) {
		int tmp = b + c + d;
		printf("ref: %d, tmp: %d\n", sum_ref, tmp);
		if (tmp < sum_last) {
			sum_ref = tmp;
		}
		if (tmp > sum_ref && tmp > sum_last) {
			counter++;
		}
		a = b;
		b = c;
		c = d;
		sum_last = a + b + c;
	}
	printf("%d\n", counter);
	return 0;
}
