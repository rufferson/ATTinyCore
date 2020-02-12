/*
  wiring_pulse.s - pulseInASM() function in different flavours
  Part of Arduino - http://www.arduino.cc/

  Copyright (c) 2014 Martino Facchin

  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General
  Public License along with this library; if not, write to the
  Free Software Foundation, Inc., 59 Temple Place, Suite 330,
  Boston, MA  02111-1307  USA
*/

/*
 * The following routine was generated by avr-gcc 4.8.3 with the following parameters
 * -gstabs -Wa,-ahlmsd=output.lst -dp -fverbose-asm -O2
 * on the original C function
 *
 * unsigned long pulseInSimpl(volatile uint8_t *port, uint8_t bit, uint8_t stateMask, unsigned long maxloops)
 * {
 *     unsigned long width = 0;
 *     // wait for any previous pulse to end
 *     while ((*port & bit) == stateMask)
 *         if (--maxloops == 0)
 *             return 0;
 *
 *     // wait for the pulse to start
 *     while ((*port & bit) != stateMask)
 *         if (--maxloops == 0)
 *             return 0;
 *
 *     // wait for the pulse to stop
 *     while ((*port & bit) == stateMask) {
 *         if (++width == maxloops)
 *             return 0;
 *     }
 *     return width;
 * }
 *
 * some compiler outputs were removed but the rest of the code is untouched
 */

#include <avr/io.h>

.section .text

.global countPulseASM

countPulseASM:

.LM0:
.LFBB1:
    push r12   ;   ;  130 pushqi1/1 [length = 1]
    push r13   ;   ;  131 pushqi1/1 [length = 1]
    push r14   ;   ;  132 pushqi1/1 [length = 1]
    push r15   ;   ;  133 pushqi1/1 [length = 1]
    push r16   ;   ;  134 pushqi1/1 [length = 1]
    push r17   ;   ;  135 pushqi1/1 [length = 1]
/* prologue: function */
/* frame size = 0 */
/* stack size = 6 */
.L__stack_usage = 6
    mov r30,r24  ;  port, port   ;  2 *movhi/1  [length = 2]
    mov r31,r25  ;  port, port
/*     unsigned long width = 0;
***     // wait for any previous pulse to end
***     while ((*port & bit) == stateMask)
*/
.LM1:
    rjmp .L2   ;   ;  181 jump  [length = 1]
.L4:
/*         if (--maxloops == 0) */
.LM2:
    rjmp .LM2A ; waste an extra 5 cycles
.LM2A:
    rjmp .LM2B ;
.LM2B:
    nop ;
    subi r16,1   ;  maxloops,  ;  17  addsi3/2  [length = 4]
    sbc r17, r1   ;  maxloops
    sbc r18, r1   ;  maxloops
    sbc r19, r1   ;  maxloops
    breq .L13  ; ,   ;  19  branch  [length = 1]
.L2:
/*         if (--maxloops == 0) */
.LM3:
    ld r25,Z   ;  D.1554, *port_7(D)   ;  22  movqi_insn/4  [length = 1]
    and r25,r22  ;  D.1554, bit  ;  24  andqi3/1  [length = 1]
    cp r25,r20   ;  D.1554, stateMask  ;  25  *cmpqi/2  [length = 1]
    breq .L4   ; ,   ;  26  branch  [length = 1]
    rjmp .L6   ;   ;  184 jump  [length = 1]
.L7:
/*             return 0;
***
***     // wait for the pulse to start
***     while ((*port & bit) != stateMask)
***         if (--maxloops == 0)
*/
.LM4:
    rjmp .LM4A ; waste an extra 5 cycles
.LM4A:
    rjmp .LM4B ;
.LM4B:
    nop ;
    subi r16,1   ;  maxloops,  ;  31  addsi3/2  [length = 4]
    sbc r17, r1   ;  maxloops
    sbc r18, r1   ;  maxloops
    sbc r19, r1   ;  maxloops
    breq .L13  ; ,   ;  33  branch  [length = 1]
.L6:
/*         if (--maxloops == 0) */
.LM5:
    ld r25,Z   ;  D.1554, *port_7(D)   ;  41  movqi_insn/4  [length = 1]
    and r25,r22  ;  D.1554, bit  ;  43  andqi3/1  [length = 1]
    cpse r25,r20   ;  D.1554, stateMask  ;  44  enable_interrupt-3  [length = 1]
    rjmp .L7   ;
    mov r12, r1   ;  width  ;  7 *movsi/2  [length = 4]
    mov r13, r1   ;  width
    mov r14, r1   ;  width
    mov r15, r1   ;  width
    rjmp .L9   ;   ;  186 jump  [length = 1]
.L10:
/*             return 0;
***
***     // wait for the pulse to stop
***     while ((*port & bit) == stateMask) {
***         if (++width == maxloops)
*/
.LM6:
    ldi r24,-1   ; ,   ;  50  addsi3/3  [length = 5]
    sub r12,r24  ;  width,
    sbc r13,r24  ;  width,
    sbc r14,r24  ;  width,
    sbc r15,r24  ;  width,
    cp r16,r12   ;  maxloops, width  ;  51  *cmpsi/2  [length = 4]
    cpc r17,r13  ;  maxloops, width
    cpc r18,r14  ;  maxloops, width
    cpc r19,r15  ;  maxloops, width
    breq .L13  ; ,   ;  52  branch  [length = 1]
.L9:
/*         if (++width == maxloops) */
.LM7:
    ld r24,Z   ;  D.1554, *port_7(D)   ;  60  movqi_insn/4  [length = 1]
    and r24,r22  ;  D.1554, bit  ;  62  andqi3/1  [length = 1]
    cp r24,r20   ;  D.1554, stateMask  ;  63  *cmpqi/2  [length = 1]
    breq .L10  ; ,   ;  64  branch  [length = 1]
/*             return 0;
***     }
***     return width;
*/
.LM8:
    mov r22,r12  ;  D.1553, width  ;  108 movqi_insn/1  [length = 1]
    mov r23,r13  ;  D.1553, width  ;  109 movqi_insn/1  [length = 1]
    mov r24,r14  ;  D.1553, width  ;  110 movqi_insn/1  [length = 1]
    mov r25,r15  ;  D.1553, width  ;  111 movqi_insn/1  [length = 1]
/* epilogue start */
.LM9:
    pop r17  ;   ;  171 popqi [length = 1]
    pop r16  ;   ;  172 popqi [length = 1]
    pop r15  ;   ;  173 popqi [length = 1]
    pop r14  ;   ;  174 popqi [length = 1]
    pop r13  ;   ;  175 popqi [length = 1]
    pop r12  ;   ;  176 popqi [length = 1]
    ret  ;  177 return_from_epilogue  [length = 1]
.L13:
.LM10:
    ldi r22,0  ;  D.1553   ;  120 movqi_insn/1  [length = 1]
    ldi r23,0  ;  D.1553   ;  121 movqi_insn/1  [length = 1]
    ldi r24,0  ;  D.1553   ;  122 movqi_insn/1  [length = 1]
    ldi r25,0  ;  D.1553   ;  123 movqi_insn/1  [length = 1]
/* epilogue start */
.LM11:
    pop r17  ;   ;  138 popqi [length = 1]
    pop r16  ;   ;  139 popqi [length = 1]
    pop r15  ;   ;  140 popqi [length = 1]
    pop r14  ;   ;  141 popqi [length = 1]
    pop r13  ;   ;  142 popqi [length = 1]
    pop r12  ;   ;  143 popqi [length = 1]
    ret  ;  144 return_from_epilogue  [length = 1]
