#include<stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include"f_fun.h"

void fun(int);

int main (void)
{
   int a;
   char hostname[1024];
        gethostname(hostname, 1024);	
	printf("Hello %s welcome to world\nEnter fun to go:",hostname);
        scanf("%d",&a);
	printf("scaned number %d\n",a);
        fun(a);
 return EXIT_SUCCESS;
}

