function tx_signal = modulate(tx_symbols,Ts,nsymbols)
    global Tsampling
    t = (0:Tsampling:nsymbols*Ts);
    tx_signal(1:length(t))=(0);
    %tx_signal = zeros(1,length(t));
    for k = 1:nsymbols
        tx_signal = tx_signal+tx_symbols(k)*(1/sqrt(Ts)*rectpuls(t-Ts/2-(k-1)*Ts,Ts));
    end
end