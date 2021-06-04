(load "engine.l")                # Official former lib.l
(symbols '(chess simul pico))    # https://software-lab.de/chess/README
(load "fen.l")

(de boom ()
   (println F Color Cast Moves)
   (quit "Boom!") )
(let Cnt 0
   (in '(xzcat mateIn2.xz)
      (until (eof)
         (let
            (F (read)
               Color (read)
               Cast (read)
               First (splitMoves (read)) )
            (line T) # EOF guard
            (chess~setup 3 (== 'b Color) (fen F Cast))
            (apply yourMove First)
            (do 3
               (NIL (myMove) (boom))
               (xchg '*Me '*You) )
            (xchg '*Me '*You)
            (test T (mate *You))
         )
         (println (inc 'Cnt))
      )
   )
)

(msg 'ok)
(bye)
