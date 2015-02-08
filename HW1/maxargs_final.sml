(* maxargs.sml - Functions to process the straight-line programs from
                 Chapter 1 of Modern Compiler Implementation in ML
   Copyright 2014 - Humberto Ortiz-Zuazaga <humberto.ortiz@upr.edu>
   (till line 19)
*)

(* Copyright 2015 - Edwardo S. Rivera Hazim <edwardo.rivera@upr.edu>*)

use "slp.sml";

(* mutually recursive functions to count args *)

(* 
The assignment says to count the arguments in PrintStm only. I
changed it slightly to count arguments of any statement or expression.
*)
fun maxexp (IdExp id)  = 1
  | maxexp (NumExp n) = 1
  | maxexp (OpExp (e1, _ , e2)) = Int.max(3,Int.max(maxexp(e1), maxexp(e2)))
  | maxexp (EseqExp (s1, e1)) = Int.max(2,Int.max(maxstm(s1), maxexp(e1))) 
(* Added the following code by me (Edwardo) *)  
and maxstm (CompoundStm (q1, q2)) = Int.max(2,Int.max(maxstm(q1), maxstm(q2)))
  | maxstm (AssignStm (_,el1)) = Int.max(2,maxexp(el1)) (*puedes dejarlo asi o poner id1 en _*)
  | maxstm (PrintStm l) = Int.max(List.length(l), maxarglist(l)) (*El orden de como hago las cosas importa?? ej mejor maxarglist primero?*)
and maxarglist [] = 0 
  | maxarglist (e::l) = Int.max(maxexp(e), maxarglist(l));

(* e es el primero de la lista, l es una la lista de los demas elementos sin el primero. )
map y foldr
fun foo n = n + 1;
	op+;
foldl 0 op+ lalista;
maxstm (PrintStm l) = Int.max(length l, foldl Int.max 0 (map maxexp l))

aveces es mejor sin parentesis!

maxlist (primero::losdemas) = 
val env = [("b",5),("a",3)];
fun lookup ([],_) = 0  
| lookup((primerid,valor)::resto,id) = if primerid == id then valor else lookup(resto,id)

(*
maxexp (NumExp 5);

maxexp (IdExp "a");

maxstm (AssignStm ("b",(NumExp 5))); 

maxexp (OpExp (NumExp 3, Plus, (NumExp 5)));
*)
maxstm prog;

val prog2 = 
 CompoundStm(AssignStm("a",OpExp(NumExp 5, Plus, NumExp 3)),
  CompoundStm(AssignStm("b",
      EseqExp(PrintStm[IdExp"a",OpExp(IdExp"a", Minus,NumExp 1)],
           OpExp(NumExp 10, Times, IdExp"a"))),
   PrintStm[IdExp "b",NumExp 5,NumExp 4,NumExp 3,NumExp 2,NumExp 1]));

maxstm prog2;