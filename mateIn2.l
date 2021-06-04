(load "engine.l")                # Official former lib.l
(symbols '(chess simul pico))    # https://software-lab.de/chess/README
(load "fen.l")

(de boom ()
   (println F Color Cast Moves)
   (quit "Boom!") )
(let Cnt 0
   (in '(bash -c "xzcat mateIn2.xz")
      (until (eof)
         (let
            (F (read)
               Color (read)
               Cast (read)
               Moves (read-moves)
               Flg )
            (line T) # EOF guard
            (chess~setup 3 (== 'b Color) (fen F Cast))
            (apply yourMove (car Moves))
            (for M (cdr Moves)
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
