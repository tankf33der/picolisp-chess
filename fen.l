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
(de cast-count (Str)
   # bit list K Q k q
   (let L (need 4 0)
      (mapc
         '((C)
            (cond
               ((= C "K") (set L 1))
               ((= C "Q") (set (cdr L) 1))
               ((= C "k") (set (cddr L) 1))
               ((= C "q") (set (cdddr L) 1)) ) )
         (chop Str) )
      L ) )
(de read-moves ()
   (let C 0
      (cons
         (splitMoves (read))
         (prog
            (until (eol)
               (read)
               (inc 'C) )
            C ) ) ) )
(de -moved? (A)
   # XXX, fixme, too much
   (cond
      ((or
            (and (= R 2) (= A "P"))
            (and (= R 7) (= A "p")) )
         T )
      ((and
            (= A "K")
            (or
               (gt0 (car Cast))
               (gt0 (cadr Cast)) ) )
         T )
      ((and
            (= A "k")
            (or
               (gt0 (caddr Cast))
               (gt0 (cadddr Cast)) ) )
         T )
      ((and
            (= A "R")
            (= R 1)
            (= C 97)
            (=1 (cadr Cast)) )
         T )
      ((and
            (= A "R")
            (= R 1)
            (= C 104)
            (=1 (car Cast)) )
         T )
      ((and
            (= A "r")
            (= R 8)
            (= C 97)
            (=1 (cadddr Cast)) )
         T )
      ((and
            (= A "r")
            (= R 8)
            (= C 104)
            (=1 (caddr Cast)) )
         T ) ) )
(de fen (Lst Cast)
   (let (R 8  C 97  Cast (cast-count Cast))
      (make
         (for L (chop Lst)
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
(de splitMoves (Str)
   (let S (chop Str)
      (make
         (link
            (intern (pack (head 2 S)))
            (intern (pack (head 2 (tail -2 S)))) )
         (when (cddddr S) (link (piece? (get S 5)))) ) ) )
