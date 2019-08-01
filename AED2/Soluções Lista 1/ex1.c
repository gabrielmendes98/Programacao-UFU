#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {

	FILE *f;
	f = fopen("arq.txt", "a");

	char x[100];

	while (1) {
		scanf("%s",&x);
		if (strcmp(x,"0")==0)
			break;
		fprintf(f, "%s\r\n", x);
	}
    fclose(f);

    f = fopen("arq.txt", "r");
    char ch;

    while((ch=getc(f))!=EOF)
        printf("%c", ch);

    fclose(f);

	return 0;
}
