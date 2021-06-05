# Generation #3.
#
(load "engine.l")                # Official former lib.l
(symbols '(chess simul pico))    # https://software-lab.de/chess/README
(load "fen.l")
(de boom ()
   (println F Color Cast Moves)
   (quit "Boom!") )
(let Cnt 0
   (unless (argv) (quit "usage"))
   (in (list 'xzcat (opt))
      (until (eof)
         (let
            (F (read)
               Color (read)
               Cast (read)
               firstMove (splitMoves (read)) )
            (line T) # EOF guard
            (println F Color Cast firstMove)
            (chess~setup 5 (== 'b Color) (fen F Cast))
            (apply yourMove firstMove)
            (test
               'mate
               (loop
                  (T (or (mate *Me) (mate *You)) 'mate)
                  (NIL (println (myMove)) (boom))
                  (xchg '*Me '*You) ) ) )
         (println (inc 'Cnt)) ) ) )
(bye)
