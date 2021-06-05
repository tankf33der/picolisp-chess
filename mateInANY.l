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
               Moves (read-moves) )
            (line T) # EOF guard
            (chess~setup (cdr Moves) (== 'b Color) (fen F Cast))
            (apply yourMove (car Moves))
            (do (cdr Moves)
               (NIL (myMove) (boom))
               (xchg '*Me '*You) )
            (xchg '*Me '*You)
            (test T (mate *You)) )
         (println (inc 'Cnt)) ) ) )
(bye)
