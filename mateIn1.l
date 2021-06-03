(load "engine.l")       # Official former lib.l
(symbols '(chess simul pico))
(load "fen.l")

(let Cnt 0
   (in '(xzcat mateIn1.xz)
      (until (eof)
         (let
            (F (read)
               Color (read)
               Cast (read)
               P1 (splitMoves (read))
               P2 (splitMoves (read)) )
            (line) # EOF guard
            (chess~setup 1 (= 'b Color) (fen F Cast))
            (if (apply yourMove P1)
               (let (M (myMove)  X (list (cadr M) (cddr M)))
                  (test
                     T
                     (bool
                        (or
                           (= X P2)
                           (find = X P2)
                           (inCheck *You) ) ) ) )
               (println F Color Cast P1 P2)
               (quit "Boom!") )
            (println (inc 'Cnt)) ) ) ) )
(msg 'ok)
(bye)
