#include <stdio.h>
#include <string.h>

int main(void) {
	int aim = 0;
	int depth = 0;
	int h_pos = 0;
	char move[100];
	int inc;
	while (scanf("%s %d", move, &inc) != EOF) {
		if (strcmp(move, "forward") == 0) {
			h_pos += inc;
			depth += aim * inc;
		}
		else if (strcmp(move, "up") == 0) {
			aim -= inc;		
		}
		else {
			aim += inc;
		}
	}
	printf("%d\n", depth * h_pos);
	return 0;
}
