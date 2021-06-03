(load "engine.l")                # Official former lib.l
(symbols '(chess simul pico))    # https://software-lab.de/chess/README
(load "fen.l")

(de boom ()
   (println F Color Cast Moves)
   (quit "Boom!") )
(de cmp (A B)
   (let B (list (cadr B) (cddr B))
      (println 'A A 'B B)
      (or
         (= A B)
         (find = A B)
         (inCheck *You)
         (inCheck *Me) )
   )
)
(let Cnt 0
   (in '(bash -c "xzcat mateIn2.xz | head -15")
      (until (eof)
         (let
            (F (read)
               Color (read)
               Cast (read)
               Moves (read-moves)
               Flg )
            (line T) # EOF guard
            # (println 'new Color Moves)
            (chess~setup 3 (== 'b Color) (fen F Cast))
            (apply yourMove (car Moves))
            (for M (cdr Moves)
               (NIL (cmp M (myMove)) (boom))
               (xchg '*Me '*You)
            )
         )
         (println (inc 'Cnt))
      )
   )
)

(msg 'ok)
(bye)
