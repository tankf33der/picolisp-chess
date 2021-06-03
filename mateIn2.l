(load "engine.l")                # Official former lib.l
(symbols '(chess simul pico))    # https://software-lab.de/chess/README
(load "fen.l")

(de boom ()
   (println F Color Cast Moves)
   (quit "Boom!") )
(let Cnt 0
   (in '(bash -c "xzcat mateIn2.xz | head -20")
      (until (eof)
         (let
            (F (read)
               Color (read)
               Cast (read)
               Moves (read-moves)
               Flg )
            (line T) # EOF guard
            (println 'new Color Moves)
            (chess~setup 3 (== 'b Color) (fen F Cast))
            (apply yourMove (car Moves))
            (for M (cdr Moves)
               (println M (myMove))
               (xchg '*Me '*You)
            )               
         )
      )
   )
)

(msg 'ok)
(bye)
