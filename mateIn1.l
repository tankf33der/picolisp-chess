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
# (chess~setup 3 NIL (fen "8/8/8/P6p/8/2RnkN2/r7/3K4"))
# (if (apply yourMove (splitMoves "f3e1"))
   # (let (M (myMove)  P2 (splitMoves "a2d2"))
      # (println 'M M 'P2 P2 (list (cadr M) (cddr M)))
      # (test (list (cadr M) (cddr M)) P2)
   # )
   # (println 'Boom)
   # (quit) )
# 
# (chess~setup 3 T (fen "5r1k/Q6p/1pb3p1/4q3/4p3/1BP2p1P/PP4P1/5RK1"))
# (if (yourMove 'f3 'g2)
   # (println 'move (myMove))
   # (quit "Boom") )

(let Cnt 0
   (in '(bash -c "xzcat mateIn1.xz | head -2000")
      (until (eof)
         (let
            (F (read)
               C (read)
               P1 (splitMoves (read))
               P2 (splitMoves (read)) )
            (line) # EOF guard
            # (println F  C P1 P2)
            (chess~setup 3 (= 'b C) (fen F))
            (if (apply yourMove P1)
               (let (M (myMove)  X (list (cadr M) (cddr M)))
                  (test
                     T
                     (bool
                        (or
                           (= X P2)
                           (find = X P2)
                           (inCheck *You) ) ) ) )
               (println F C P1 P2)
               (quit "Boom!")
            )
            (println (inc 'Cnt))
         )
      )
   )
)

(msg 'ok)
(bye)
