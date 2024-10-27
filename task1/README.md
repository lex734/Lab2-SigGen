# Task 1

rom.sv file produced which has address width 8 and data width 8 such that it is able to store 2**8 = 256 memory addresses which are 8 bits wide each.
Using a D-flip flop initialised by always_ff at each rising edge of the clock, the output of the rom is the value stored at that memory address that is inputted into the ROM at the previous clock cycle.

sinegen.sv file is a sine wave generator module with address-width 8 and data-width 8. The input signals are clock, reset, enable and increase. The output is dout.
Within the sinegen.sv, there is a counter module added using counter.sv. The output of counter is address. This means that at the rising edge of the clock, the count increases by 1. Hence, the counter goes through all 2^8 possible values which are all the 2^8 possible addresses of the ROM.
The sinerom.sv file thus uses the counter to go through all memory addresses of the ROM and outputs the value stored in the ROM at each memory address.

The sinegen.py file produces values and stores them in the ROM. At each memory address, the value stores inside is the hexadecimal value of a cosine function at line 5. Hence, the ROM stores, at each memory address, values of a cosine function starting from 256//2 = 127, which is why the value at memory address is 0 and a sine wave is produced instead of a cosine wave.

## Challenge
The challenge entails using the value in vbdValue() to make changes to the frequency of the sine wave.
I identified the function vbdValue() at line 1104 of vbuddy.cpp.
In sinegen_tb.cpp, at line 43, I added a new variable called freq which is equals to vbdValue(). The increase to top which is the value into counter is equal to 1 + (freq%10) which maps vbdValue() to values from 0 to 10 and adds one to frequency such that the incr is always at least 1 and the counter increases. Thus, the frequency changes depending on vbdValue().