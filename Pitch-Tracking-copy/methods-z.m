1. import data into shiftedpitch_data{1,each_block}(d, 1:nframes_to_use)
2. REMOVE FIRST 200 FRAMES (REACTION TIME)
3. REMOVE BAD TRIALS ACCORDING TO WHERE THERE IS NO AMP SIGNAL
4. REMOVE FIRST 50 (framestoremove) FRAMES AFTER BREAK IN VOICING
5. create pre and post windows at this point
6. convert to cents
7. REMOVE BAD TRIALS ACCORDING TO STDEV:
8. REMOVE ACCORDING TO MOTOR PERFORMANCE (cents)
9. calculate distance from the target in cents


