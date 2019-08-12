# MATLAB-Communications-System-Model-Implementation
 Implementing key functions associated with a digital transmitter (a mapper and a modulator) and a digital receiver (the demapper and the demodulator), and carrying out basic simulations to assess the behaviour of different signalling schemes

## A communication system consists of three main blocks:
    1. Digital Transmitter – comprises a mapper and a modulator
    2. AWGN (Additive White Gaussian Noise) communications channel
    3. Digital Receiver – comprises a demapper and a demodulator

### The simulation parameters associated with the MATLAB implementation of the communications system model are:

* Tsampling: Defines the sampling period associated with the simulation of the communications system.
* fsampling: Defines the sampling frequency associated with the simulation of the communications system.
* nbits: This relates to the number of bits used in the simulation of the communications systems.
* nsymbols: This relates to the number of symbols used in the simulation of the communications systems.
* alphabets: This defines the signalling scheme alphabet. For example, alphabet = [−1,1] for polar binary digital signalling and alphabet = [0,1] for unipolar binary digital signalling.
* Tb, Ts: These define the bit period and the symbol period associated with the signalling scheme.
* N0: This corresponds to the noise one-sided power density spectrum.

### The functions associated with the MATLAB implementation of the communications system model are:
    '''
     tx_symbols = map(tx_bits,alphabet)
    '''
    The function ‘map’ converts a bit stream (tx_bits) onto a symbol stream (tx_symbols) associated with the relevant alphabet.
    '''
     tx_signal = modulate(tx_symbols,Ts,nsymbols)
    '''
    The function ‘modulate’ converts a stream of symbols (tx_symbols) onto a digital signal
    (tx_signal).
    '''
    rx_signal = tx_signal + sqrt(fsampling * N0/2) * randn(1,length(t);
    '''
    This step models the additive white Gaussian noise (AWGN) channel which is the next block.
    
    Note that the standard deviation of the noise random variables depends both on the noise power spectral density as well as on Tsampling / fsampling (which define the bandwidth of the simulation) .
    '''
    rx_symbols = demodulate(rx_signal,Ts,nsymbols)
    '''
    The function ‘demodulate’ converts the digital signal (rx_signal) onto a stream of
    symbols(rx_symbols).
    '''
    rx_bits = demap(rx_symbols,alphabet)
    '''
    The function ‘demap’ converts a stream of symbols (rx_symbols) onto a stream of bits (rx_bits).

![Bit To Symbol Mapping](/Images/BitToSymbolMapping.png)

## Mapping schemes:
 Mapping in the three schemes can be represented as shown. Therefore, the alphabets for each scheme will be as follows:

* Binary Unipolar Scheme: A = {0,1}
* Binary Polar Scheme: A = {-1,1}
* Quaternary Scheme: A = {-3,-1,1,3}



#### Algorithm of map function
'''
Define function map which accepts two parameters tx_bits and alphabets
Initialise the tx_symbols with zeros
Create a matrix aux that is made by reshaping4 tx_bits to a matrix of size log2(Number of alphabets) x Number of symbols
Next, to map the bits to alphabets use the following steps: for k = 1:length(tx_symbols)
tx_symbols(k) = alphabet(bi2de(aux(k,:),'left-msb')+1); end
End of function
'''
#### Algorithm of modulate function
'''
Define function modulate which accepts three parameters tx_symbols, Ts and nsymbols
Define global variable Tsampling
Define vector t with numbers 0 to Number of symbols*Ts with a spacing of Tsampling
Initialise tx_signal with zeros
(Note: The length of tx_signal is the length of vector t)
Next, to modulate the symbols onto the signal use the following steps 5:
for k = 1:nsymbols
tx_signal = tx_signal+tx_symbols(k)*(1/sqrt(Ts)*rectpuls(t-Ts/2(k- 1)*Ts,Ts));
end
End of function
'''


#### Algorithm of demodulate function
'''
Define function demodulate which accepts three parameters rx_signal, Ts and nsymbols
Define global variable Tsampling
Define vector t with numbers 0 to Number of symbols*Ts with a spacing of Tsampling
Initialise rx_symbols with zeros
(Note: The length of rx_symbols is the length of vector nsymbols)
Next, to demodulate the symbols onto the signal use the following steps: 
for k = 1:nsymbols
rx_symbols(k) = Tsampling * sum(rx_signal .* (1/sqrt(Ts) * rectpuls(t- Ts/2-(k-1)*Ts,Ts))) ;
End of function
'''

#### Algorithm of demapfunction
'''
Define function demap which accepts two parameters rx_symbols and alphabet
Initialise the matrix rx_bits with zeros
(Note: The length of rx_bits is the length of vector log2(Number of alphabets)*length(rx_symbols)
Next, to demap the symbols onto the signal use the following steps6:
   for k1 = 1:length(rx_symbols)
     aux = Inf;
     for k2 = 1:length(alphabet)
if (rx_symbols(k1) - alphabet(k2))^2 < aux
aux = (rx_symbols(k1) - alphabet(k2))^2 ; rx_bits(:,k1) = de2bi(k2-1,log2(length(alphabet)))' ;
end end
end
Reshape rx_bits into a vector of size 1xlength(rx_bits)*log2(Number of alphabets)
End of function
'''
