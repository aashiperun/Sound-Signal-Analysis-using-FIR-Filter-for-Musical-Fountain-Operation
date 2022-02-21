# Sound Signal Analysis using FIR Filter for Musical Fountain Operation 
### Digital Signal Processing

The audio signal can be divided into two different ranges such that each one is created by one Finite Impusle Response (FIR) filter and each filter represents a narrow band of frequencies. 

The filter output is used to control the speed of a water pump and LED light. 
Thus, the heads of the water jets and the LEDs are controlled according to the analog control signals which are created by the FIR filters. 

                           Simulation of the system using four FIR filters in Simulink
 ![image](https://user-images.githubusercontent.com/66789469/154849304-5f50e0c4-b088-4203-85e2-ed0ae25235d5.png)

#### METHODOLOGY
1. Import an Audio file in the mp3 format.
2. The filter output is applied to analog control voltage terminals of a motor and LED.
3. When the window method is applied to filter impulse response, we get the convolution of impulse response and the window function. The convolution of h(n) and w(n) has the effect on smoothing of the filter frequency response.
4. We use the Window technique to design the FIR filters.  We make use of a Hamming window with an order(N) of 66.
5. We create a High Pass Filter with a cut off frequency(ω) of 0.5 ω.
6. The signal frequency range is now split into two. For the first frequency range, the first LED (Pin 8) along with the water pump (Pin 11) is turned on. For the second frequency range, the second LED (Pin 9) along with the water pump (Pin 12) is turned on.


                          Output of Audio Signal after passing it through the FIR filer
![image](https://user-images.githubusercontent.com/66789469/154547050-958cd182-ade8-471e-a68f-ab6c78121aa1.png)

