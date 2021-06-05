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
            (chess~setup 5 (== 'b Color) (fen F Cast))
            # (chess~setup (cddr Moves) (== 'b Color) (fen F Cast))
            (println F Moves Color *Me *You)
            (apply yourMove (car Moves))
            (println 'after-your *Me *You)

            (do (cadr Moves)
               (println 'bef-myMove *Me *You)
               (T (or (mate *Me) (mate *You)))
               (NIL (println (myMove)) (boom))
               (xchg '*Me '*You) )
            (xchg '*Me '*You)
            (test T (mate *You)) )
         (println (inc 'Cnt)) ) ) )
(bye)
