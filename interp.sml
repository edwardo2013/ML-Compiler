(* interp.sml -  HW#2: Functions to process the straight-line programs
	 			 from Chapter 1 of Modern Compiler Implementation in 
	 			 ML. Writed an interpetrer to interp the small program
	 			 prog defined in slp.sml 

Copyright 2015 - Edwardo S. Rivera Hazim <edwardo.rivera@upr.edu>
*)


(*datatypes are here*)
use "slp.sml";

(*some variables*)
exception UnboundIdentifier
val mtenv = []

(*lookup function: look an id on the enviroment (table). Returns the value (int) of the id*)
fun lookup (l: table, id: id): int =
  case l of [] => raise UnboundIdentifier (* base case: list empty so id no found *) 
  | (firstId, firstInt)::tail =>
    if firstId = id then firstInt else lookup(tail,id) (* recursive case verify id, if not found keep going*)

(*update function: update a variable, just add the new variable at the front of the enviroment*)
fun update (id,value,env) = (id,value)::env;

(*Interp function, three mutual recursive functions
interpPrint: to interp the PrintStm.
interpStm: Interp an statement. Returns the enviroment.
interpExp: Interp an expression. Returns a value and the new enviroment.*)
fun interpPrint ([], env) = env
	| interpPrint(first::rest,env) =   
		let 
			val (v1,env1) = interpExp(first,env) (* interp the first exp, then interp the others
													with the new enviromnent. Print the value*)
		in
			print (Int.toString(v1) ^ "\n"); 
			interpPrint(rest,env1)
		end

and interpExp (IdExp id,env) = (lookup(env,id),env) (*lookup the id*)
  | interpExp (NumExp n,env) = (n,env) 				(* just give the number back*)
  | interpExp (OpExp (e1,myop,e2),env) = 			(*interp first e1m then e2*)
	let 
		val (v1,env1) = interpExp(e1,env)
		val (v2,env2) = interpExp(e2,env1)
	in
		case myop of Plus => (v1 + v2, env2)		(*cases of binop*)
		 			| Minus => (v1 - v2, env2)
					| Times => (v1 * v2, env2)
					| Div => (v1 div v2, env2)		
	end
  | interpExp (EseqExp (s1,e1),env) =  				(*interp the stm first, then the exp*)
  	let 
  		val env1 = interpStm(s1,env)
  	in 
  		interpExp(e1,env1)
  	end
and interpStm (CompoundStm (q1,q2), env) = interpStm(q2, interpStm(q1, env)) (*interp the compound stm*)
	| interpStm (AssignStm (id,exp),env) = 							(*interp the given exp and the assign it to id*)
	let
		val (v1,env1) = interpExp(exp,env)
	in
		update(id,v1,env1)											(*update the id*)
	end
	| interpStm (PrintStm explist,env) = interpPrint(explist,env); 	(*See interpPrint*)


(* Some tests *)
val prog2 = 
 CompoundStm(AssignStm("a",OpExp(NumExp 5, Div, NumExp 3)),
 (AssignStm("b", (NumExp 3)))); 

val prog3 = EseqExp(AssignStm("a",NumExp 3),OpExp(NumExp 10, Times, IdExp "a"));

interpStm(prog2,mtenv);
interpExp(prog3,mtenv);

(*Program to interp*)
interpStm(prog,mtenv);