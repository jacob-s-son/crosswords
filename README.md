crosswords
==========

Make sure to change path in dictionary_spec.rb and word_finder_spec.rb files to Your dictionary file



BENCHMARKING dictionary implementations

Master implementation:

Rehearsal --------------------------------------------------
Each 10th word   1.040000   0.000000   1.040000 (  1.038160)
Each 5th word    2.080000   0.000000   2.080000 (  2.085326)
Each 3rd word    3.430000   0.010000   3.440000 (  3.432707)
Each 2nd word    5.130000   0.010000   5.140000 (  5.142987)
All words       10.260000   0.010000  10.270000 ( 10.272464)
---------------------------------------- total: 21.970000sec

                     user     system      total        real
Each 10th word   1.030000   0.000000   1.030000 (  1.030944)
Each 5th word    2.060000   0.000000   2.060000 (  2.055734)
Each 3rd word    3.430000   0.000000   3.430000 (  3.431132)
Each 2nd word    5.130000   0.000000   5.130000 (  5.134714)
All words       10.310000   0.010000  10.320000 ( 10.372485)



Alternative tree like implementation

