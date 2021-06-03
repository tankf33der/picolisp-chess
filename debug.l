# NIL - white
#(chess~main 2 NIL
#(quote (a8 (+Black +Rook)) (f8 (+White +Knight)) (g8 (+Black +King)) (a7 (+Black +Pawn) T) (b7 (+Black +Pawn) T) (c7 (+Black +Pawn) T) (f7 (+Black +Pawn) T) (g7 (+Black +Pawn) T) (h7 (+Black +Pawn) T) (h6 (+Black +Knight)) (d5 (+Black +Pawn)) (g5 (+Black +Queen)) (b4 (+White +Pawn)) (d4 (+White +Pawn)) (h4 (+Black +Knight)) (a3 (+White +Pawn)) (e3 (+White +Pawn)) (g3 (+Black +Bishop)) (h3 (+White +Pawn)) (b2 (+White +Bishop)) (d2 (+White +Knight)) (f2 (+White +Pawn) T) (a1 (+White +Rook)) (d1 (+White +Queen)) (f1 (+White +Rook)) (g1 (+White +King)))
#)

# cd pil21
# pil chess/cli.l -chess~main
# <copy-paste>

(load "fen.l")

(println (fen "r1b1r1k1/1p4pp/8/2p2pq1/3ppPP1/P6P/1BPPQ3/R4RK1" "-"))
(bye)


(in '(bash -c "xzcat mateIn1.xz | head -3")
   (until (eof)
      (let
         (P1 (read)
            P2 (read)
            P3 (read)
            P4 (splitMoves (read))
            P5 (splitMoves (read)) )
         (when (= 3 (length P4))
            (println P1 P2 P3 P4 P5)
         )
         (line T)
      )
   )
)
(msg 'ok)
(bye)
