function tx_symbols = map(tx_bits, alphabet)
    nbits = 1000 ; nsymbols = nbits / log2(length(alphabet)) ;
    tx_symbols(1:nsymbols) = (0);
    aux = reshape(tx_bits,[log2(length(alphabet)),nsymbols]);
    for k = 1:length(tx_symbols)
        tx_symbols(k) = alphabet(bi2de(aux(:,k),'left-msb')+1);
    end
end