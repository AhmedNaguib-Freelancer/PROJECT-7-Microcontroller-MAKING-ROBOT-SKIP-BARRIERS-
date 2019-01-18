#line 1 "C:/Users/only try/Desktop/PROJECT 7 Microcontroller (MAKING ROBOT SKIP BARRIERS)/PROGRAM/ROBOT.c"
void FORWARD()
{
PORTB=0B00000101;
}
void REVERSE()
{
PORTB=0B00001010;
}
void LEFT()
{
PORTB=0B00001001;
}
void RIGHT()
{
PORTB=0B00000110;
}

void main() {
TRISB=0;
TRISD=255;
pwm1_init(5000);
pwm2_init(5000);
pwm1_set_duty(127);
pwm2_set_duty(127);
PORTB=0B00000101;
while(1){
if(PORTD.F0==1)
{
REVERSE();
delay_ms(1000);
pwm1_start();
pwm2_start();
LEFT();
delay_ms(1000);
pwm1_stop();
pwm2_stop();
FORWARD();
}
else if (PORTD.F1==1)
{
REVERSE();
delay_ms(1000);
pwm1_start();
pwm2_start();
RIGHT();
delay_ms(1000);
pwm1_stop();
pwm2_stop();
FORWARD();
}
}
}
