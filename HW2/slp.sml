(* sml.sml -  for HW#2: Declarations of datatypes of Chapter 1 of 
              Modern Compiler Implementation in ML. Provided by the 
              book. Added the 8 line.
Copyright 2015 - Edwardo S. Rivera Hazim <edwardo.rivera@upr.edu>
*)

type id = string
type table = (id * int) list (*Table, enviroment type*)

datatype binop = Plus | Minus | Times | Div

datatype stm = CompoundStm of stm * stm
	     | AssignStm of id * exp
	     | PrintStm of exp list

     and exp = IdExp of id
	     | NumExp of int
             | OpExp of exp * binop * exp
             | EseqExp of stm * exp

(*program to interp*)
val prog = 
 CompoundStm(AssignStm("a",OpExp(NumExp 5, Plus, NumExp 3)),
  CompoundStm(AssignStm("b",
      EseqExp(PrintStm[IdExp"a",OpExp(IdExp"a", Minus,NumExp 1)],
           OpExp(NumExp 10, Times, IdExp"a"))),
   PrintStm[IdExp "b"]))

