(load "engine.l")       # Official former lib.l
(symbols '(chess simul pico))
(load "fen.l")

(dm (img> . +White) ()
   (pack " " (name> This) " ") )

(dm (img> . +Black) ()
   (pack "<" (name> This) ">") )

(de display (Res)
   (when Res
      (disp *Board T
         '((This)
            (cond
               ((: piece) (img> @))
               ((: color) " - ")
               (T "   ") ) ) ) )
   (and (inCheck *You) (prinl "(+)"))
   Res )
(de go Args
   # (println 'A Args)
   (display
      (cond
         ((not Args) (xchg '*Me '*You) (myMove))
         ((== '- (car Args)) (and *Undo (undo)))
         ((== '+ (car Args)) (and *Redo (redo)))
         ((apply yourMove Args) (display T) (myMove)) ) ) )

# (println
   # (fen "8/p7/4Q2p/3p2p1/3q2k1/5p2/PP4PK/8" "-") )
# (bye)

# (msg 'start)
# (chess~setup 1 NIL
   # (fen "rnq1k1nr/ppp1bpP1/8/5P2/8/5p1P/PP1P4/RNBQKBNR" "KQkq"))
# (display T)
# (setq P1 (splitMoves "g7h8n"))
# (println 'apply (apply yourMove P1))
# (chess~display T)
# (myMove)
# (chess~display T)
# (bye)

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
