#include <stdio.h>
#include <string.h>

int main(void) {
	int h_pos = 0;
	int v_pos = 0;
	char move[100];
	int inc;
	while (scanf("%s %d", move, &inc) != EOF) {
		if (strcmp(move, "forward") == 0) {
			h_pos += inc;
		}
		else if (strcmp(move, "up") == 0) {
			v_pos -= inc;		
		}
		else {
			v_pos += inc;
		}
	}
	printf("%d\n", h_pos * v_pos);
	return 0;
}
