#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main(int argc,char* argv[])
{
	char* s[3] = {"A", "B", "C"};
	int i;
	for(i=0;i<3;i++){
		if(fork()==0){
			execl("/bin/echo","/bin/echo",s[i],NULL);
		}
	}
	return 0;
}
