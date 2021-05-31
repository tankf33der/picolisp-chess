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
(de -moved? (A)
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
                  (let (Color (color? L)  Piece (piece? L)  Flg (-moved? L))
                     (link
                        (cons
                           (intern (pack (char C) R))
                           (list Color Piece)
                           (if Flg (cons Flg)) ) )
                     (inc 'C) ) ) ) ) ) ) )
