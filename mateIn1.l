(load "lib.l")
(symbols '(chess simul pico))

(load "fen.l")

# (dm (img> . +White) ()
   # (pack " " (name> This) " ") )
# (dm (img> . +Black) ()
   # (pack "<" (name> This) ">") )
# (de display (Res)
   # (when Res
      # (disp *Board T
         # '((This)
            # (cond
               # ((: piece) (img> @))
               # ((: color) " - ")
               # (T "   ") ) ) ) )
   # (and (inCheck *You) (prinl "(+)"))
   # Res )

# NIL - white
# (chess~setup 3 NIL (fen (chop "8/8/8/P6p/8/2RnkN2/r7/3K4")))
# (if (yourMove 'f3 'e1)
   # (println 'move (myMove))
   # (println 'Boom)
   # (quit) )
# 
# (chess~setup 3 T (fen (chop "5r1k/Q6p/1pb3p1/4q3/4p3/1BP2p1P/PP4P1/5RK1")))
# (if (yourMove 'f3 'g2)
   # (println 'move (myMove))
   # (quit "Boom") )

(in '(xzcat mateIn1.xz)
   (until (eof)
      (let (F (read)  C (read)  P1 (read)  P2 (read))
         (line)
         (println (== 'w C) P1 P2)
      )
   )
)


(msg 'ok)
(bye)
