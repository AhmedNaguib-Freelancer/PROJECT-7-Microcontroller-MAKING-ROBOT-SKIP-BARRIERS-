
_FORWARD:

;ROBOT.c,1 :: 		void FORWARD()
;ROBOT.c,3 :: 		PORTB=0B00000101;
	MOVLW      5
	MOVWF      PORTB+0
;ROBOT.c,4 :: 		}
L_end_FORWARD:
	RETURN
; end of _FORWARD

_REVERSE:

;ROBOT.c,5 :: 		void REVERSE()
;ROBOT.c,7 :: 		PORTB=0B00001010;
	MOVLW      10
	MOVWF      PORTB+0
;ROBOT.c,8 :: 		}
L_end_REVERSE:
	RETURN
; end of _REVERSE

_LEFT:

;ROBOT.c,9 :: 		void LEFT()
;ROBOT.c,11 :: 		PORTB=0B00001001;
	MOVLW      9
	MOVWF      PORTB+0
;ROBOT.c,12 :: 		}
L_end_LEFT:
	RETURN
; end of _LEFT

_RIGHT:

;ROBOT.c,13 :: 		void RIGHT()
;ROBOT.c,15 :: 		PORTB=0B00000110;
	MOVLW      6
	MOVWF      PORTB+0
;ROBOT.c,16 :: 		}
L_end_RIGHT:
	RETURN
; end of _RIGHT

_main:

;ROBOT.c,18 :: 		void main() {
;ROBOT.c,19 :: 		TRISB=0;
	CLRF       TRISB+0
;ROBOT.c,20 :: 		TRISD=255;
	MOVLW      255
	MOVWF      TRISD+0
;ROBOT.c,21 :: 		pwm1_init(5000);
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      99
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;ROBOT.c,22 :: 		pwm2_init(5000);
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      99
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;ROBOT.c,23 :: 		pwm1_set_duty(127);
	MOVLW      127
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;ROBOT.c,24 :: 		pwm2_set_duty(127);
	MOVLW      127
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;ROBOT.c,25 :: 		PORTB=0B00000101; //FORWARD
	MOVLW      5
	MOVWF      PORTB+0
;ROBOT.c,26 :: 		while(1){
L_main0:
;ROBOT.c,27 :: 		if(PORTD.F0==1)
	BTFSS      PORTD+0, 0
	GOTO       L_main2
;ROBOT.c,29 :: 		REVERSE(); //REVERSE
	CALL       _REVERSE+0
;ROBOT.c,30 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;ROBOT.c,31 :: 		pwm1_start();
	CALL       _PWM1_Start+0
;ROBOT.c,32 :: 		pwm2_start();
	CALL       _PWM2_Start+0
;ROBOT.c,33 :: 		LEFT(); //LEFT DIRESTION
	CALL       _LEFT+0
;ROBOT.c,34 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;ROBOT.c,35 :: 		pwm1_stop();
	CALL       _PWM1_Stop+0
;ROBOT.c,36 :: 		pwm2_stop();
	CALL       _PWM2_Stop+0
;ROBOT.c,37 :: 		FORWARD(); //FORWARD
	CALL       _FORWARD+0
;ROBOT.c,38 :: 		}
	GOTO       L_main5
L_main2:
;ROBOT.c,39 :: 		else if (PORTD.F1==1)
	BTFSS      PORTD+0, 1
	GOTO       L_main6
;ROBOT.c,41 :: 		REVERSE(); //REVERSE
	CALL       _REVERSE+0
;ROBOT.c,42 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
	NOP
;ROBOT.c,43 :: 		pwm1_start();
	CALL       _PWM1_Start+0
;ROBOT.c,44 :: 		pwm2_start();
	CALL       _PWM2_Start+0
;ROBOT.c,45 :: 		RIGHT(); //RIGHT DIRESTION
	CALL       _RIGHT+0
;ROBOT.c,46 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
	NOP
;ROBOT.c,47 :: 		pwm1_stop();
	CALL       _PWM1_Stop+0
;ROBOT.c,48 :: 		pwm2_stop();
	CALL       _PWM2_Stop+0
;ROBOT.c,49 :: 		FORWARD(); //FORWARD
	CALL       _FORWARD+0
;ROBOT.c,50 :: 		}
L_main6:
L_main5:
;ROBOT.c,51 :: 		}
	GOTO       L_main0
;ROBOT.c,52 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
