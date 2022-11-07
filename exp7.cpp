#include <iostream.h>
#include <stdio.h>
#include <conio.h>
#include <process.h>
void main()
{
int op1,op2,ans,choice;
clrscr();
cout<<"EXP 7 - by COMP A, Roll No 68"<<endl;
cout<<"Calcutor Program"<<endl;
while(1)
{
cout<<endl<<endl<<"Calcutor Menu:"<<endl;
cout<<endl;
cout<<"1. Addition"<<endl;
cout<<"2. Subtraction"<<endl;
cout<<"3. Exit"<<endl;
cout<<"Your Choice: ";
cin>>choice;
if (choice==3)
{
exit(0);
}
cout<<endl<<"Enter Operand one: ";
cin>>op1;
cout<<endl<<"Enter Operand second: ";
cin>>op2;
switch(choice)
{
case 1: asm mov ax,op1;
asm add ax,op2;
asm mov ans,ax;
cout<<endl<<"Answer: "<<ans;
break;
case 2: asm mov ax,op1;
asm sub ax,op2;
asm mov ans,ax;

cout<<endl<<"Answer: "<<ans;
break;
case 3: exit(0);
break;

default: cout<<endl<<"Invalid choice";

break;

}
}
getch();
}