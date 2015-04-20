structure Semant :
     sig val transProg : Absyn.exp -> unit end =
struct
  structure A = Absyn

  (* dummy translate for chapter 5 *)
  structure Translate = struct type exp = unit end

  (*given information, tenv is the type enviroment, venv is the value enviroment
   and expy is the return value of transExp in transVar functions*)
  type expty = {exp: Translate.exp, ty: Types.ty}
  type venv = Env.enventry Symbol.table
  type tenv = Types.ty Symbol.table

  exception ErrMsg

  (*NOT USED. helper function to lookup types. Maybe used if want to typecheck more than a simple type dec*)
    fun typelookup tenv n pos= 
  let 
    val result= Symbol.look (tenv, n)
  in  
    (case result of
      SOME ty2 => ty2
    | NONE => (ErrorMsg.error pos ("type is not defined: " ^ Symbol.name n) ; Types.UNIT))
  end

  (*find the correct type in tenv. Used in declaration of type*)
  fun transTy(tenv, A.NameTy(sym, pos)) = 
      (case Symbol.look(tenv, sym)
        of NONE => (ErrorMsg.error pos ("Type " ^ Symbol.name(sym) ^ 
                      " is not defined."); Types.UNIT)
        | SOME(typ) => typ)
      | transTy (tenv, _ ) = (ErrorMsg.error 0 ( "Cannot typecheck this yet in transTy"); Types.UNIT) 

  (*Tried to do this ... *)
  (*    fun transTy (tenv, t) =
      (case t of 
          A.NameTy (n, pos) => typelookup tenv n pos
        |  A.RecordTy fields => (ErrorMsg.error pos "Cannot do this ")
        |  A.ArrayTy (n,pos) => (ErrorMsg.error pos ("Cannot do this " ^ Symbol.name n))) *)

  
  (*helper function to skip names and give the proper type t, used in trvar*)
  fun actual_ty (Types.NAME (s,ty)) = 
    (case !ty of (*ty is option ref, so we need to dererenece the pointer*)
      NONE => raise ErrMsg (*nothing here, raise an error!*)
    | SOME t => actual_ty t)
    | actual_ty t = t  (*give the type t as the result*)

  (* checks if the given type is a string, returns unit or an error- also unit. Used for comparison operators*)
  fun checkString({ty=Types.STRING,exp = _}, pos) = ()  
  | checkString ({ty=_,exp=_},pos) = ErrorMsg.error pos "string required" 

  (* checks if the given type is an integer, returns unit or an error- also unit*)
  fun checkInt ({ty=Types.INT, exp=_}, pos) = ()
  | checkInt ({ty=_,exp=_},pos) = ErrorMsg.error pos "integer required"

  (*user function, the one that is called to do typecheking (it does not do the hard work)*)
  fun transProg (exp:A.exp) : unit =
    let
      val {ty=_, exp=prog} = transExp (Env.base_venv, Env.base_tenv) exp
    in
      prog
    end

  (* translate a exp - type checking the hard work is here*)
  and transExp(venv:venv,tenv:tenv) : A.exp -> expty =

    let fun trexp (A.OpExp{left, oper, right, pos}) =

      (*in this case, must be integer*)
      if oper = A.PlusOp orelse oper = A.MinusOp orelse oper = A.TimesOp orelse oper = A.DivideOp then
        (checkInt (trexp left, pos);
        checkInt (trexp right, pos);
        {ty=Types.INT, exp=()})

        (*Added string comparison, it can be integer or string for this opers*)
      else if oper = A.EqOp orelse oper = A.NeqOp orelse oper = A.LeOp orelse oper = A.LtOp 
              orelse oper = A.GeOp orelse oper = A.GtOp then
         let
            val l = trexp left (*find what exp is *)
            val r = trexp right
          in
            (case #ty l of
              Types.INT =>
                (checkInt(l, pos);
                checkInt(r, pos);
                {ty=Types.INT,exp= ()})
             | Types.STRING =>
                (checkString(l, pos);
                checkString(r, pos);
                {ty=Types.INT,exp= ()}) (*should be int because a comparison is 1 or 0, not sure*)  
             | _ => (ErrorMsg.error pos "can't perform comparisons on this type";
                  {ty=Types.INT, exp= ()}))
           end 
      (*this case should never be executed, only if we have an operand that we dont know*)     
      else (ErrorMsg.error pos "Error";{exp= (), ty=Types.INT})

       | trexp (A.VarExp var) = trvar (var) (*Added var exp, see trvar function*)
       | trexp (A.IntExp _) = {ty=Types.INT, exp=()}
       | trexp (A.StringExp (_,_)) = {ty=Types.STRING, exp=()}
       | trexp (A.NilExp) = {ty = Types.NIL,exp=()} (*added nil expression*)
       | trexp (A.AssignExp {var, exp, pos}) =      (*added assign exp*)
          let
            val  {exp=left,  ty=expected_ty} = trvar (var) (*parse the lhs, find the type of the var*)
            val  {exp=right, ty=actual_ty} = trexp (exp) (*parse the lhs, find the type of the exp*)
          in
            if
            expected_ty <> actual_ty (*check if it is legal to assign this exp to the variable *)
            then
              (*bad assignment, give an error. we also need to give the expty expresion, as in trvar:*)
              (ErrorMsg.error pos "illegal: assignment mismatch";{exp= (), ty=Types.UNIT})
            else
              {exp= (), ty=Types.UNIT} (*good assigment, just gives a unit type*)
          end 
       | trexp (A.LetExp {decs, body, pos}) = (*made by prof. H. Ortiz*)
            let
		          fun delosenv (venv, tenv, nil) = {tenv=tenv, venv=venv}
		            | delosenv (venv, tenv, dec::decs) =
		              let
                    val {tenv=newtenv,venv=newvenv} = transDec(venv,tenv,dec)
			             in
			               delosenv (newvenv, newtenv, decs)
                  end
		         in
              let 
                val {tenv=newtenv, venv=newvenv} = delosenv(venv,tenv,decs)
		          in
		            transExp (newvenv, newtenv) body
             end
		        end

       (*this is the body of the let, need to translate all the exps := (exp * pos) list*)     
       | trexp (A.SeqExp exps) =   
          let
            fun seq_list [] = {exp = (), ty = Types.UNIT} (*empty*)
                | seq_list ((exp,pos)::nil) = trexp exp   (*only one element*)
                | seq_list ((exp,pos)::rest) = (trexp exp; seq_list rest) (*recursive case*)
            in
              seq_list (exps)
          end
        | trexp(A.CallExp{func,args,pos}) = trfun(func,args,pos) 
       (*Other cases not needed for this homework*)   
       | trexp _ = {ty=Types.UNIT, exp=ErrorMsg.error 0 "Can't typecheck this yet in trexp"}

      (*lvalue case*) 
      and trvar (A.SimpleVar(id,pos)) = 
        (case Symbol.look(venv, id) of
          SOME (Env.VarEntry{ty}) => {exp= (), ty=actual_ty ty}
        | _ => (ErrorMsg.error pos ("undefined variable: " ^ Symbol.name id); {exp=(), ty=Types.INT}))

        (*only simple case is implemented*)
        | trvar _ = {ty=Types.UNIT, exp=ErrorMsg.error 0 "Can't typecheck this yet in trvar"}

    and trfun (func, args, pos) = 
            let 
              fun matchArgs([], [], pos) = ()
                | matchArgs([], args, pos) = ErrorMsg.error pos "too many args"
                | matchArgs(formals, [], pos) = ErrorMsg.error pos "not enough args"
                | matchArgs(formal::formals, arg::args, pos) = 
                  (let val {exp, ty} = trexp arg
                   in if formal = ty
                      then ()
                      else ErrorMsg.error pos "argument is incorrect type"
                   end;
                   matchArgs(formals, args, pos))
            in
              (case Symbol.look(venv, func)
                of NONE => (ErrorMsg.error pos ("undefined function " ^
                                                Symbol.name(func));
                            {exp=(), ty=Types.UNIT})
                 | SOME(Env.FunEntry {formals, result}) =>
                     (matchArgs(formals, args, pos); {exp=(), ty=actual_ty(result)}))
            end
      
    in
      trexp
    end
      (*var declaration, without type*)
      and transDec (venv, tenv, A.VarDec{name, typ=NONE, init,... }) = 
          let 
            val {exp,ty} = transExp (venv, tenv) init
          in 
            {tenv = tenv, venv=Symbol.enter(venv, name, Env.VarEntry{ty=ty})}
          end

          (*var declaration, with type defined*)
        | transDec (venv, tenv, A.VarDec{name,escape= ref true,typ=SOME(s, pos), init, pos=pos1}) =
        let
            val {exp, ty} = transExp (venv, tenv) init 
        in
            ( case Symbol.look (tenv,s) of
                NONE => (ErrorMsg.error pos ("type not defined: " ^ Symbol.name s))
                | SOME ty2 =>  if ty<>ty2 
                                  then (ErrorMsg.error pos "type mismatch") 
                               else ();
                {tenv=tenv, venv=Symbol.enter(venv, name, Env.VarEntry{ty=ty})})
        end
          (*trans dec for type declarations*)
        | transDec(venv, tenv, A.TypeDec([])) = {tenv = tenv, venv = venv} (*base case*)
        | transDec(venv, tenv, A.TypeDec[{name,ty,pos}]) = (*only one element*) 
            {tenv = Symbol.enter(tenv, name, transTy(tenv,ty)), (*transTy find the "real" type that is inside tenv*)
            venv = venv} 
        | transDec(venv, tenv, A.TypeDec({name, ty, pos}::typs)) = (*recursive case*)
            transDec(venv, Symbol.enter(tenv, name, transTy(tenv, ty)), A.TypeDec(typs))

         (*trans dec for funcitons declarations*)   
        | transDec(venv, tenv, A.FunctionDec([])) = {tenv = tenv, venv = venv}
        | transDec(venv, tenv, A.FunctionDec[{name, params, body, pos, result=SOME(rt,pos1)}]) =
        let val result_ty = case Symbol.look(tenv, rt) of 
                              SOME(res) => res
                            | NONE => Types.UNIT (*poenr error aqui*)
          fun transparam {name, escape, typ, pos} = 
            case Symbol.look(tenv, typ) of
               SOME t => {name=name, ty=t}
            |  NONE => (ErrorMsg.error pos "type undefined"; {name=name, ty=Types.UNIT})
          val params' = map transparam params (* params' is the a list (each el is a record) of {name, ty} of each parameter*)
          val venv' = Symbol.enter(venv, name, 
              Env.FunEntry{formals = map #ty params', result = result_ty})
          fun enterparam ({name, ty}, venv) = 
              Symbol.enter (venv, name, Env.VarEntry{ty=ty})
          val venv'' = foldr enterparam venv' params'
        in transExp(venv'', tenv) body;
          {venv=venv', tenv=tenv}
        end

        | transDec (venv,tenv, _ ) = (ErrorMsg.error 0 "Can't typecheck this yet in transDec"; {venv=venv,tenv=tenv})
end
