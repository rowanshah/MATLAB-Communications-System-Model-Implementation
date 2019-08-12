function rx_bits = demap(rx_symbols,alphabet)
    rx_bits = zeros(1,log2(length(alphabet))*length(rx_symbols));
    for k1 = 1:length(rx_symbols)
        aux = Inf;
        for k2 = 1:length(alphabet)
            if (rx_symbols(k1) - alphabet(k2))^2 < aux
                aux = (rx_symbols(k1) - alphabet(k2))^2 ;
                rx_bits(:,k1) = de2bi(k2-1,log2(length(alphabet)))' ;
            end
        end
    end
end