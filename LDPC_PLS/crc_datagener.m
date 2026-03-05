function databits=crc_datagener_10(index)

            switch index
            case 1
                 N=2;
            case 2
                N=8;
            case 3
               N=22;
            case 4
                N=50;
            case 5
              N=66;
            case 6
              N=84;
            case 7
               N=176;
            case 8
              N=272;
            case 9
              N=360; 
            case 10
              N=456;
            end
     databits =randi([0 1],N,1);

end