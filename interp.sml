use "slp.sml";

fun lookup ([]:table,_:id) = 0 (*Como se pone raise aqui para que funcione?*)
	| lookup((primerid,valor)::resto : table,id:id) = if primerid=id 
										then valor 
									   else lookup(resto,id);

fun update (id,value,env) = (id,value)::env;

(*Tests*)
val env = [("b",5),("a",~18)];
val env = update("b",3,env);
lookup(env,"foo"); 
lookup(env,"a");
lookup(env,"x");

(*interpreter*)
fun interpStm (AssignStm (id,exp),env) = update(id,interpExp (exp,env),env)
	| interpStm _ = []
and interpExp (IdExp id,env) = lookup(env,id) 
	| interpExp (NumExp n,env) = n
	| interpExp (OpExp (e1,Plus,e2),env) = interpExp (e1,env) + interpExp (e2,env)
	| interpExp (OpExp (e1,Minus,e2),env) = interpExp (e1,env) - interpExp (e2,env)
	| interpExp (OpExp (e1,Times,e2),env) = interpExp (e1,env) * interpExp (e2,env)
	| interpExp (OpExp (e1,Div,e2),env) = interpExp (e1,env) div interpExp (e2,env)
	| interpExp (EseqExp l,env) = 0;

(*
fun interpStm(CompoundStm (q1,q2), env) = interpStm(q1,env)
 										  interpStm(q2,env)
	| interpStm (AssignStm (id,exp),env) = update(id,exp,env)
	| interpStm _ = 0 
and interpExp(NumExp n) = n
	| interpExp (IdExp id) = lookup(env,id)
	| interpExp _ = 0; 

*)
(*val prog2 = CompoundStm(AssignStm("a",NumExp 5),AssignStm("b",NumExp 4));
interpStm(prog2,[]);*)

val prog3 = AssignStm("a",OpExp(NumExp 5, Times, IdExp "b"));
interpStm(prog3,[("b",3)]);
