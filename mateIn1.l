(load "lib.l")
(symbols '(chess simul pico))

(load "fen.l")

(dm (img> . +White) ()
   (pack " " (name> This) " ") )
(dm (img> . +Black) ()
   (pack "<" (name> This) ">") )
(de display (Res)
   (when Res
      (disp *Board T
         '((This)
            (cond
               ((: piece) (img> @))
               ((: color) " - ")
               (T "   ") ) ) ) )
   (and (inCheck *You) (prinl "(+)"))
   Res )

# NIL - white

# (chess~setup 3 NIL (fen (chop "8/8/8/P6p/8/2RnkN2/r7/3K4")))
# (display T)
# (println (yourMove 'f3 'e1))
# (display T)
# (println (myMove))
# (display T)

# (chess~setup 3 T (fen (chop "5r1k/Q6p/1pb3p1/4q3/4p3/1BP2p1P/PP4P1/5RK1")))
# (display T)
# (println (yourMove 'f3 'g2))
# (display T)
# (println (myMove))
# (display T)

# (chess~setup 3 T (fen (chop "2kr4/1p4pp/p1p1b3/Q3Bq2/8/4PB2/1PP2PPP/1K6")))
# (display T)
# (println (yourMove 'g7 'g5))
# (display T)
# (println (myMove))
# (display T)

(chess~setup 3 T (fen (chop "2q3k1/4br1p/6RQ/1p1n2p1/7P/1P4P1/1B2PP2/6K1")))
# (display T)
(yourMove 'h7 'g6)
# (display T)
(println (myMove))
# (display T)


(msg 'ok)
(bye)
