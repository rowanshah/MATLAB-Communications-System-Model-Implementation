global Tsampling fsampling
Tsampling = 1e-7 ;
fsampling = 1/Tsampling ;
alphabet = [-1, 1] ;
Tb = 1e-6 ;
Ts = Tb * log2(length(alphabet)) ;
nbits = 1000 ; nsymbols = nbits / log2(length(alphabet)) ;
N0 = 1 ;
t = (0:Tsampling:nsymbols*Ts) ;
% Transmitted bits
tx_bits = round(rand(1,nbits)) ;
% Transmitted symbols
tx_symbols = map(tx_bits,alphabet) ;
% Transmitted signal (channel input)
tx_signal = modulate(tx_symbols,Ts,nsymbols) ;
% Received signal (channel output)
rx_signal = tx_signal + sqrt(fsampling * N0/2) * randn(1,length(t)) ;
% Received symbols
rx_symbols = demodulate(rx_signal,Ts,nsymbols) ;
% Received bits
rx_bits = demap(rx_symbols,alphabet) ;


