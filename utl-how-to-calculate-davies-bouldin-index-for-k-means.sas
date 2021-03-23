How to calculate davies-bouldin index for k-means

GitHub
https://tinyurl.com/3zxcmkvz
https://github.com/rogerjdeangelis/utl-how-to-calculate-davies-bouldin-index-for-k-means

Inspired
https://www.rdocumentation.org/packages/clusterSim/versions/0.49-2/topics/index.DB

*_                   _
(_)_ __  _ __  _   _| |_
| | '_ \| '_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
;

libname sd1 "d:/sd1";

data sd1.have ;
  input (v_1-V_5)  (6.2) @@;
cards4;
 4.79  5.08  8.49 10.43 13.29  5.05  4.95 11.63  9.60 11.74  4.73  5.57  8.66
 9.90 15.15  5.11  4.46 11.45 10.13  9.88  6.35  5.23  5.44  8.77 12.90  3.49
 4.80 14.68 11.26 12.13  4.77  3.62  8.90 12.08  7.80  5.07  6.41 11.22  7.95
17.23  5.10  5.99 10.49  8.54 15.84  4.74  4.04  9.62 11.49  9.20  5.80  6.79
11.71  6.42 17.70  4.04  3.24  8.41 13.61  7.33  6.88  3.99  7.25  9.14  7.21
 2.95  6.05 12.86 10.89 17.82  6.15  4.79  9.36  8.76 10.48  5.24 13.56 10.76
11.27 14.55  4.72 16.50 13.96  8.02 14.13  4.56 14.51  6.15 12.01 10.90  5.41
15.56  9.82 12.70 16.53  4.69 15.32 10.30  7.33  8.50  5.27 14.75 10.94  9.19
13.49  4.38 13.27  9.18 10.84 11.54  5.59 16.80 12.34 10.17  6.55  2.54 15.09
 7.77  9.86 18.49  7.42 14.98 10.33 13.08 14.48  4.84 14.04  9.78  6.95 10.56
 5.13 16.02  8.94 10.03 12.65  5.86 14.17 11.18 10.00 12.39  4.10 15.90  9.21
 5.66 13.32  5.25 14.52 10.90 14.37 11.71  9.95 10.67 11.26  9.33 11.94 10.00
 9.16  8.85 10.70 13.09 10.10 10.63 15.29  9.82 14.05  9.85  9.20  4.83 10.21
10.98  9.29 11.39 13.33 12.71 16.90 10.66  8.44  6.78  7.32  8.13  8.59 11.23
 8.98  9.87 12.58 11.36  8.60 11.13 10.16 12.45  9.52  9.09 11.76  8.51 12.89
10.43 10.74  8.35 11.53 12.14  7.99  8.92  8.07 12.00 13.60 11.96 10.91 12.04
 8.03 11.43  9.03  9.72  5.95 13.28 14.36 10.92 10.10 14.16  6.75 10.68 10.36
11.22  9.34  5.03 13.61 16.53  5.99 10.77 15.00 11.42 13.25  4.13  7.55 11.83
 9.35 14.91  6.26 12.56  8.21 15.69 14.87  3.87 10.41 13.46 14.94 15.55  4.64
 9.70  6.57 10.10 14.23  5.49  8.59 12.14 14.00 13.24  5.13 11.52  7.89 11.03
16.54  4.99  7.30 13.49 14.36 14.87  5.28 12.82  6.54 10.67 14.91  4.84 14.42
 6.95 13.26 14.77  7.18  5.70 13.08 11.77 15.01  2.95 10.70  9.92 10.47 15.47
 4.79  9.41 10.11 14.57 14.31  5.34 12.56 12.30 13.13 16.55  4.12  7.55  7.73
11.90 14.04 16.43 11.89 10.25  7.91 16.05 13.57  8.22  9.78 17.12 14.99 13.25
 5.23  7.46 12.56 15.10 16.74 14.88 12.57 12.47 16.66 15.14 10.94  8.80 12.67
13.44 14.85  9.17 11.23 12.36 14.22 15.83  7.00 10.94 12.11 15.87 14.16 13.11
 9.09 12.92 15.23 15.85  7.31  7.11  7.02 14.87 14.15 12.80 12.92 18.02 14.77
14.69  2.18 13.56  9.28 15.33 15.30 17.93  6.47 15.75 16.74 15.93 12.02  7.11
16.37 13.35 14.06  8.09 12.92  8.67 14.33 15.05  5.81  8.87 11.26
;;;;
run;quit;

*
 _ __  _ __ ___   ___ ___  ___ ___
| '_ \| '__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
;

%utl_submit_r64('
library(clusterSim);
library(haven);
have<-read_sas("d:/sd1/have.sas7bdat");
cl1 <- pam(have, 4);
d<-dist(have);
want<-index.DB(have, cl1$clustering,d, centrotypes="medoids");
want$DB;
writeClipboard(paste(want$DB));
',returnvar=DBX);

*            _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| '_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
;
%put &=DBX;

DBX=1.55531335679797
