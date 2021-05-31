(de color? (A)
   (if (upp? A) '+White '+Black) )
(de piece? (A)
   (case A
      (("p" "P") '+Pawn)
      (("k" "K") '+King)
      (("n" "N") '+Knight)
      (("r" "R") '+Rook)
      (("q" "Q") '+Queen)
      (("b" "B") '+Bishop) ) )
(de moved? (A)
   (when
      (or
         (and (= R 2) (= A "P"))
         (and (= R 7) (= A "p")) )
      @ ) )
(de fen (Lst)
   (let (R 8  C 97)
      (make
         (for L Lst
            (cond
               ((= "/" L) (dec 'R) (set 'C 97))
               ((format L) (inc 'C @))
               (T
                  (let (Color (color? L)  Piece (piece? L)  Flg (moved? L))
                     (link
                        (cons
                           (intern (pack (char C) R))
                           (list Color Piece)
                           (if Flg (cons Flg)) ) )
                     (inc 'C) ) ) ) ) ) ) )
# (fen (chop "8/8/8/P6p/8/2RnkN2/r7/3K4"))
# (println (fen (chop "2kr4/1p4pp/p1p1b3/Q3Bq2/8/4PB2/1PP2PPP/1K6")))
# (println (fen (chop "rn4k1/pp1q1r2/2pp2B1/3P4/2PB2b1/8/P2K1PP1/7R")))

(msg 'ok)
(bye)
