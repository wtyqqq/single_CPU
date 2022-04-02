#include <stdio.h>
const int MAX=50;

long long result[50];

long long fib( int num){
    if(num == 1 || num == 2){
        return 1;
    }
    if(result[num])
        return result[num];
    else {
        result[num] = fib(num - 2) + fib(num - 1);
        return result[num];
    }
}
int main() {
    int ipt;
    scanf("%d",&ipt);
    if(ipt>=MAX) {
        printf("too large!\n");
    }else {
        printf("%lld", fib(ipt));
    }return 0;
}
