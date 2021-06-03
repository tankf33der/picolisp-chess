# pil filter-csv.l > mateIn1
# xz -f mateIn1
# note: cut en-passant puzzles
(in "../mate1"
   (until (eof)
      (from ",")
      (let
         (Fen (read)
            Color (read)
            Cast (read)
            Passant (read) )
         (unless (= Passant "-")
            (from ",")
            (prinl
               Fen 
               ","
               Color
               ","
               Cast
               ","
               (till ",") ) )
         # EOF guard
         (line T) ) ) )
(bye)
