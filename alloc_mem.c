#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
 
int main(int argc, char *argv[])
{
    char *p1;
    char *p2;
    char *p3;
    char *p4;
 
    sleep(10); 
    p1 = malloc(500);
 
    p2 = malloc(200);
 
    p3 = malloc(300);
 
    p4 = malloc(300);
 
    free(p1);
 
    free(p2);
 
    free(p3);
 
    free(p2);
 
    printf("p1: %p, p2: %p, p3: %p, p4: %p\n", p1, p2, p3, p4);
 
    return 0;
}

