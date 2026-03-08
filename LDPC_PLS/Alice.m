function [modSignal,noisedsignal,databits,h,g,noiseVar,a_small_inteval,index]=Alice(SNR,R,N)
      
            % h1= 1/sqrt(2)*(randn + 1i*randn);  
            % g1= 1/sqrt(2)*(randn + 1i*randn); 
            % 
            % A=sqrt(R)*[h1;g1];
            % h=A(1);
            % g=A(2);
            h= 1/sqrt(2)*(randn + 1i*randn);  
            g= 1/sqrt(2)*(randn + 1i*randn); 

            pilot_symbols = [1+1i,  1-1i,  -1+1i, -1-1i];
            pilot = repmat(pilot_symbols, 1, N/4); % 长度为 N

            noiseVar=2/(10^(SNR/10));
            noise_std = sqrt(noiseVar/2);
            noise_a = noise_std * (randn(1, N) + 1j * randn(1, N));

            % 接收信号
            rx_a = h * pilot + noise_a;
            h_a = sum(rx_a .* conj(pilot)) / sum(abs(pilot).^2);
            h_a=h;
             CQI = abs(h_a)^2;
    
            [index,H]=choose_H(CQI);
            
            %将每个间隔再分为8个小间隔，计算估计值在那个小间隔
            a_small_inteval=calculate_small_inteval(index,CQI);
  
            %disp(index)
            H = sparse(H ~= 0);
        
            %生成原始数据
            cfgLDPCEnc = ldpcEncoderConfig(H);
            %databits =randi([0 1],cfgLDPCEnc.NumInformationBits,1,'int8');

            %不同间隔需要不同CRC位数，需要的数据位数也不同
            databits=crc_datagener(index);

            %添加CRC
            [data_bits, ~] = add_crc(databits);

            %进行LDPC编码
            codeword = ldpcEncode(data_bits, cfgLDPCEnc);
        
            %qpsk调制  
            modSignal = qpskmod(codeword);
           
            %经过衰落信道
            chanSignal=h*modSignal;
         
            %加噪 
            noise = sqrt(noiseVar/2) * (randn(length(chanSignal), 1) + 1i * randn(length(chanSignal), 1));  
            noisedsignal = chanSignal+noise;

end