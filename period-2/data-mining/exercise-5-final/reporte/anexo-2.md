Resumen de los clústers obtenidos para el mes de enero (a través de la función ```summary```)
=============================================================================================
Los siguientes datos fueron obtenidos de la función ```summary``` para los 4 clusters generados para el mes de abril, con una altura de 4000000.
Es importante recordad que las columnas consideradas fueron:
- DayOfWeek
- AirTime  
- ArrDelay 
- DepDelay 
- TaxiIn   
- TaxiOut    

En este caso una muy ligera separación entre los valores de la media existentes para la columna AirTime.
Sin embargo es una muy pequeña distancia como para juzgar el hallazgo de información relevante.

```
> summary(instancias_en_cluster_uno)
     Month          DayofMonth      DayOfWeek        DepTime       CRSDepTime      ArrTime       CRSArrTime   UniqueCarrier      FlightNum            TailNum       ActualElapsedTime CRSElapsedTime     AirTime           ArrDelay       
 Min.   : 1.000   Min.   : 1.00   Min.   :1.000   Min.   :   1   Min.   :   0   Min.   :   1   Min.   :   1   WN     :108769   Min.   :   1               :  3330   Min.   :  13.0    Min.   :-25.0   Min.   :-1407.0   Min.   :-240.000  
 1st Qu.: 4.000   1st Qu.: 8.00   1st Qu.:2.000   1st Qu.: 930   1st Qu.: 930   1st Qu.:1123   1st Qu.:1128   AA     : 97036   1st Qu.: 515   <e4>NKNO<e6>:   855   1st Qu.:  73.0    1st Qu.: 75.0   1st Qu.:   55.0   1st Qu.: -10.000  
 Median : 7.000   Median :16.00   Median :4.000   Median :1329   Median :1325   Median :1528   Median :1530   DL     : 82887   Median :1107   000000      :   674   Median : 109.0    Median :110.0   Median :   87.0   Median :  -3.000  
 Mean   : 6.505   Mean   :15.71   Mean   :3.935   Mean   :1341   Mean   :1337   Mean   :1502   Mean   :1509   UA     : 66936   Mean   :1370   UNKNOW      :   510   Mean   : 127.4    Mean   :129.5   Mean   :  105.8   Mean   :   3.166  
 3rd Qu.: 9.000   3rd Qu.:23.00   3rd Qu.:6.000   3rd Qu.:1730   3rd Qu.:1725   3rd Qu.:1917   3rd Qu.:1915   NW     : 58354   3rd Qu.:1834   N183UW      :   397   3rd Qu.: 161.0    3rd Qu.:162.0   3rd Qu.:  137.0   3rd Qu.:   8.000  
 Max.   :12.000   Max.   :31.00   Max.   :7.000   Max.   :2400   Max.   :2359   Max.   :2400   Max.   :2400   US     : 58240   Max.   :6878   N73         :   357   Max.   :1500.0    Max.   :660.0   Max.   :  668.0   Max.   :1946.000  
                                                  NA's   :7365                  NA's   :8306                  (Other):127581                  (Other)     :593680   NA's   :8306                      NA's   :8322      NA's   :8306      
    DepDelay            Origin            Dest           Distance          TaxiIn            TaxiOut         Cancelled       CancellationCode    Diverted       
 Min.   :-1370.00   ORD    : 37418   ORD    : 37191   Min.   :  31.0   Min.   :   0.000   Min.   :  0.00   Min.   :0.00000   Mode:logical     Min.   :0.000000  
 1st Qu.:   -4.00   DFW    : 32205   DFW    : 32045   1st Qu.: 328.0   1st Qu.:   4.000   1st Qu.: 10.00   1st Qu.:0.00000   NA's:599803      1st Qu.:0.000000  
 Median :    0.00   ATL    : 26510   ATL    : 26453   Median : 599.0   Median :   5.000   Median : 13.00   Median :0.00000                    Median :0.000000  
 Mean   :    5.53   LAX    : 20636   LAX    : 20688   Mean   : 758.6   Mean   :   6.365   Mean   : 15.12   Mean   :0.01228                    Mean   :0.001569  
 3rd Qu.:    4.00   PHX    : 19770   PHX    : 19602   3rd Qu.:1009.0   3rd Qu.:   7.000   3rd Qu.: 18.00   3rd Qu.:0.00000                    3rd Qu.:0.000000  
 Max.   : 1952.00   MSP    : 15986   MSP    : 16141   Max.   :4962.0   Max.   :1437.000   Max.   :448.00   Max.   :1.00000                    Max.   :1.000000  
 NA's   :7365       (Other):447278   (Other):447683                                                                                                             
> summary(instancias_en_cluster_dos)
     Month          DayofMonth      DayOfWeek        DepTime        CRSDepTime      ArrTime        CRSArrTime   UniqueCarrier      FlightNum            TailNum       ActualElapsedTime CRSElapsedTime     AirTime           ArrDelay       
 Min.   : 1.000   Min.   : 1.00   Min.   :1.000   Min.   :   1    Min.   :   1   Min.   :   1    Min.   :   1   WN     :163220   Min.   :   1               :  5199   Min.   : 11.0     Min.   : 15.0   Min.   :-1405.0   Min.   :-283.000  
 1st Qu.: 4.000   1st Qu.: 8.00   1st Qu.:2.000   1st Qu.: 930    1st Qu.: 930   1st Qu.:1124    1st Qu.:1128   AA     :145316   1st Qu.: 515   <e4>NKNO<e6>:  1295   1st Qu.: 74.0     1st Qu.: 75.0   1st Qu.:   55.0   1st Qu.: -10.000  
 Median : 7.000   Median :16.00   Median :4.000   Median :1328    Median :1325   Median :1527    Median :1530   DL     :124257   Median :1107   000000      :   970   Median :109.0     Median :110.0   Median :   87.0   Median :  -3.000  
 Mean   : 6.505   Mean   :15.72   Mean   :3.938   Mean   :1340    Mean   :1337   Mean   :1502    Mean   :1509   UA     :100276   Mean   :1369   UNKNOW      :   768   Mean   :127.4     Mean   :129.4   Mean   :  105.7   Mean   :   3.248  
 3rd Qu.: 9.000   3rd Qu.:23.00   3rd Qu.:6.000   3rd Qu.:1729    3rd Qu.:1724   3rd Qu.:1917    3rd Qu.:1915   NW     : 87510   3rd Qu.:1831   N183UW      :   594   3rd Qu.:161.0     3rd Qu.:162.0   3rd Qu.:  137.0   3rd Qu.:   8.000  
 Max.   :12.000   Max.   :31.00   Max.   :7.000   Max.   :2400    Max.   :2359   Max.   :2400    Max.   :2359   US     : 87213   Max.   :6878   N93         :   533   Max.   :728.0     Max.   :660.0   Max.   :  702.0   Max.   :1504.000  
                                                  NA's   :11222                  NA's   :12665                  (Other):190946                  (Other)     :889379   NA's   :12665                     NA's   :12683     NA's   :12665     
    DepDelay            Origin            Dest           Distance          TaxiIn            TaxiOut          Cancelled       CancellationCode    Diverted       
 Min.   : -70.000   ORD    : 55898   ORD    : 55933   Min.   :  21.0   Min.   :   0.000   Min.   :   0.00   Min.   :0.00000   Mode:logical     Min.   :0.000000  
 1st Qu.:  -4.000   DFW    : 48113   DFW    : 47677   1st Qu.: 328.0   1st Qu.:   4.000   1st Qu.:  10.00   1st Qu.:0.00000   NA's:898738      1st Qu.:0.000000  
 Median :   0.000   ATL    : 39683   ATL    : 39281   Median : 599.0   Median :   5.000   Median :  13.00   Median :0.00000                    Median :0.000000  
 Mean   :   5.566   LAX    : 31220   LAX    : 31141   Mean   : 758.1   Mean   :   6.346   Mean   :  15.14   Mean   :0.01249                    Mean   :0.001606  
 3rd Qu.:   4.000   PHX    : 29821   PHX    : 29571   3rd Qu.:1009.0   3rd Qu.:   7.000   3rd Qu.:  18.00   3rd Qu.:0.00000                    3rd Qu.:0.000000  
 Max.   :1505.000   MSP    : 24125   MSP    : 24371   Max.   :4962.0   Max.   :1433.000   Max.   :1401.00   Max.   :1.00000                    Max.   :1.000000  
 NA's   :11222      (Other):669878   (Other):670764                                                                                                              
> summary(instancias_en_cluster_tres)
     Month          DayofMonth      DayOfWeek        DepTime        CRSDepTime      ArrTime        CRSArrTime   UniqueCarrier      FlightNum            TailNum       ActualElapsedTime CRSElapsedTime     AirTime           ArrDelay       
 Min.   : 1.000   Min.   : 1.00   Min.   :1.000   Min.   :   1    Min.   :   1   Min.   :   1    Min.   :   1   WN     :170041   Min.   :   1               :  5502   Min.   : 12.0     Min.   :  1.0   Min.   :-1427.0   Min.   :-987.000  
 1st Qu.: 4.000   1st Qu.: 8.00   1st Qu.:2.000   1st Qu.: 930    1st Qu.: 930   1st Qu.:1124    1st Qu.:1129   AA     :151480   1st Qu.: 517   <e4>NKNO<e6>:  1343   1st Qu.: 73.0     1st Qu.: 75.0   1st Qu.:   55.0   1st Qu.: -10.000  
 Median : 7.000   Median :16.00   Median :4.000   Median :1328    Median :1325   Median :1528    Median :1530   DL     :129578   Median :1109   000000      :   979   Median :109.0     Median :110.0   Median :   87.0   Median :  -3.000  
 Mean   : 6.505   Mean   :15.71   Mean   :3.934   Mean   :1340    Mean   :1337   Mean   :1503    Mean   :1509   UA     :104462   Mean   :1370   UNKNOW      :   785   Mean   :127.4     Mean   :129.5   Mean   :  105.8   Mean   :   3.165  
 3rd Qu.: 9.000   3rd Qu.:23.00   3rd Qu.:6.000   3rd Qu.:1729    3rd Qu.:1724   3rd Qu.:1917    3rd Qu.:1915   NW     : 91263   3rd Qu.:1833   N183UW      :   625   3rd Qu.:161.0     3rd Qu.:163.0   3rd Qu.:  137.0   3rd Qu.:   8.000  
 Max.   :12.000   Max.   :31.00   Max.   :7.000   Max.   :2400    Max.   :2359   Max.   :2400    Max.   :2359   US     : 91064   Max.   :6878   N92         :   550   Max.   :721.0     Max.   :660.0   Max.   :  690.0   Max.   :2137.000  
                                                  NA's   :11793                  NA's   :13292                  (Other):199244                  (Other)     :927348   NA's   :13292                     NA's   :13314     NA's   :13292     
    DepDelay            Origin            Dest           Distance          TaxiIn            TaxiOut          Cancelled       CancellationCode    Diverted     
 Min.   :-981.000   ORD    : 58268   ORD    : 58097   Min.   :  30.0   Min.   :   0.000   Min.   :   0.00   Min.   :0.00000   Mode:logical     Min.   :0.0000  
 1st Qu.:  -4.000   DFW    : 49582   DFW    : 50328   1st Qu.: 328.0   1st Qu.:   4.000   1st Qu.:  10.00   1st Qu.:0.00000   NA's:937132      1st Qu.:0.0000  
 Median :   0.000   ATL    : 41118   ATL    : 41371   Median : 599.0   Median :   5.000   Median :  13.00   Median :0.00000                    Median :0.0000  
 Mean   :   5.523   LAX    : 32648   LAX    : 32691   Mean   : 759.2   Mean   :   6.375   Mean   :  15.12   Mean   :0.01258                    Mean   :0.0016  
 3rd Qu.:   4.000   PHX    : 31007   PHX    : 30906   3rd Qu.:1009.0   3rd Qu.:   7.000   3rd Qu.:  18.00   3rd Qu.:0.00000                    3rd Qu.:0.0000  
 Max.   :2119.000   MSP    : 25276   DTW    : 25168   Max.   :4962.0   Max.   :1440.000   Max.   :1436.00   Max.   :1.00000                    Max.   :1.0000  
 NA's   :11793      (Other):699233   (Other):698571                                                                                                            
> summary(instancias_en_cluster_cuatro)
     Month          DayofMonth      DayOfWeek        DepTime        CRSDepTime      ArrTime        CRSArrTime   UniqueCarrier      FlightNum            TailNum        ActualElapsedTime CRSElapsedTime      AirTime           ArrDelay       
 Min.   : 1.000   Min.   : 1.00   Min.   :1.000   Min.   :   1    Min.   :   1   Min.   :   1    Min.   :   1   WN     :256498   Min.   :   1               :   7956   Min.   :  12.0    Min.   :-162.0   Min.   :-1440.0   Min.   :-125.000  
 1st Qu.: 4.000   1st Qu.: 8.00   1st Qu.:2.000   1st Qu.: 930    1st Qu.: 930   1st Qu.:1124    1st Qu.:1128   AA     :228465   1st Qu.: 515   <e4>NKNO<e6>:   1972   1st Qu.:  73.0    1st Qu.:  75.0   1st Qu.:   55.0   1st Qu.: -10.000  
 Median : 7.000   Median :16.00   Median :4.000   Median :1328    Median :1325   Median :1528    Median :1530   DL     :195314   Median :1108   000000      :   1481   Median : 109.0    Median : 110.0   Median :   87.0   Median :  -3.000  
 Mean   : 6.505   Mean   :15.71   Mean   :3.935   Mean   :1340    Mean   :1337   Mean   :1502    Mean   :1509   UA     :157607   Mean   :1370   UNKNOW      :   1196   Mean   : 127.4    Mean   : 129.4   Mean   :  105.7   Mean   :   3.195  
 3rd Qu.: 9.000   3rd Qu.:23.00   3rd Qu.:6.000   3rd Qu.:1730    3rd Qu.:1725   3rd Qu.:1917    3rd Qu.:1915   NW     :137562   3rd Qu.:1833   N183UW      :    958   3rd Qu.: 161.0    3rd Qu.: 163.0   3rd Qu.:  137.0   3rd Qu.:   8.000  
 Max.   :12.000   Max.   :31.00   Max.   :7.000   Max.   :2400    Max.   :2359   Max.   :2400    Max.   :2359   US     :136974   Max.   :6878   N103        :    824   Max.   :1613.0    Max.   : 660.0   Max.   :  666.0   Max.   :1710.000  
                                                  NA's   :17313                  NA's   :19494                  (Other):300498                  (Other)     :1398531   NA's   :19494                      NA's   :19527     NA's   :19494     
    DepDelay             Origin             Dest            Distance          TaxiIn            TaxiOut          Cancelled       CancellationCode    Diverted       
 Min.   :-1005.000   ORD    :  87634   ORD    :  87836   Min.   :  30.0   Min.   :   0.000   Min.   :   0.00   Min.   :0.00000   Mode:logical     Min.   :0.000000  
 1st Qu.:   -4.000   DFW    :  75603   DFW    :  75362   1st Qu.: 328.0   1st Qu.:   4.000   1st Qu.:  10.00   1st Qu.:0.00000   NA's:1412918     1st Qu.:0.000000  
 Median :    0.000   ATL    :  62193   ATL    :  62129   Median : 599.0   Median :   5.000   Median :  13.00   Median :0.00000                    Median :0.000000  
 Mean   :    5.527   LAX    :  48675   LAX    :  48765   Mean   : 758.2   Mean   :   6.356   Mean   :  15.14   Mean   :0.01225                    Mean   :0.001544  
 3rd Qu.:    4.000   PHX    :  46534   PHX    :  46965   3rd Qu.:1009.0   3rd Qu.:   7.000   3rd Qu.:  18.00   3rd Qu.:0.00000                    3rd Qu.:0.000000  
 Max.   : 1731.000   MSP    :  37881   DTW    :  37838   Max.   :4962.0   Max.   :1439.000   Max.   :1439.00   Max.   :1.00000                    Max.   :1.000000  
 NA's   :17313       (Other):1054398   (Other):1054023                                                                                                              
> summary(instancias_en_cluster_cinco)
     Month          DayofMonth      DayOfWeek        DepTime        CRSDepTime      ArrTime        CRSArrTime   UniqueCarrier      FlightNum            TailNum        ActualElapsedTime CRSElapsedTime     AirTime           ArrDelay      
 Min.   : 1.000   Min.   : 1.00   Min.   :1.000   Min.   :   1    Min.   :   1   Min.   :   1    Min.   :   1   WN     :258217   Min.   :   1               :   7937   Min.   :  12.0    Min.   :  1.0   Min.   :-1411.0   Min.   : -82.00  
 1st Qu.: 4.000   1st Qu.: 8.00   1st Qu.:2.000   1st Qu.: 931    1st Qu.: 930   1st Qu.:1124    1st Qu.:1129   AA     :230142   1st Qu.: 515   <e4>NKNO<e6>:   2034   1st Qu.:  73.0    1st Qu.: 75.0   1st Qu.:   55.0   1st Qu.: -10.00  
 Median : 7.000   Median :16.00   Median :4.000   Median :1329    Median :1325   Median :1528    Median :1530   DL     :196722   Median :1108   000000      :   1579   Median : 109.0    Median :110.0   Median :   87.0   Median :  -3.00  
 Mean   : 6.505   Mean   :15.71   Mean   :3.937   Mean   :1340    Mean   :1337   Mean   :1502    Mean   :1509   UA     :158606   Mean   :1369   UNKNOW      :   1224   Mean   : 127.4    Mean   :129.5   Mean   :  105.8   Mean   :   3.18  
 3rd Qu.: 9.000   3rd Qu.:23.00   3rd Qu.:6.000   3rd Qu.:1729    3rd Qu.:1724   3rd Qu.:1916    3rd Qu.:1915   NW     :138642   3rd Qu.:1831   N183UW      :    980   3rd Qu.: 161.0    3rd Qu.:163.0   3rd Qu.:  137.0   3rd Qu.:   8.00  
 Max.   :12.000   Max.   :31.00   Max.   :7.000   Max.   :2400    Max.   :2359   Max.   :2400    Max.   :2359   US     :138173   Max.   :6878   N105        :    848   Max.   :1600.0    Max.   :856.0   Max.   :  659.0   Max.   :1481.00  
                                                  NA's   :17450                  NA's   :19742                  (Other):302266                  (Other)     :1408166   NA's   :19742                     NA's   :19774     NA's   :19742    
    DepDelay            Origin             Dest            Distance          TaxiIn            TaxiOut          Cancelled       CancellationCode    Diverted       
 Min.   :-712.000   ORD    :  88170   ORD    :  88337   Min.   :  31.0   Min.   :   0.000   Min.   :   0.00   Min.   :0.00000   Mode:logical     Min.   :0.000000  
 1st Qu.:  -4.000   DFW    :  75796   DFW    :  75998   1st Qu.: 328.0   1st Qu.:   4.000   1st Qu.:  10.00   1st Qu.:0.00000   NA's:1422768     1st Qu.:0.000000  
 Median :   0.000   ATL    :  62424   ATL    :  62664   Median : 599.0   Median :   5.000   Median :  13.00   Median :0.00000                    Median :0.000000  
 Mean   :   5.523   LAX    :  49222   LAX    :  49149   Mean   : 758.4   Mean   :   6.348   Mean   :  15.14   Mean   :0.01226                    Mean   :0.001611  
 3rd Qu.:   4.000   PHX    :  46810   PHX    :  46894   3rd Qu.:1009.0   3rd Qu.:   7.000   3rd Qu.:  18.00   3rd Qu.:0.00000                    3rd Qu.:0.000000  
 Max.   :1497.000   MSP    :  38272   MSP    :  38416   Max.   :4962.0   Max.   :1440.000   Max.   :1439.00   Max.   :1.00000                    Max.   :1.000000  
 NA's   :17450      (Other):1062074   (Other):1061310  
 ```