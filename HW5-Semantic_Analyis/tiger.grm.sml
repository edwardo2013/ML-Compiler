functor TigerLrValsFun(structure Token : TOKEN)
 : sig structure ParserData : PARSER_DATA
       structure Tokens : Tiger_TOKENS
   end
 = 
struct
structure ParserData=
struct
structure Header = 
struct
structure A = Absyn

end
structure LrTable = Token.LrTable
structure Token = Token
local open LrTable in 
val table=let val actionRows =
"\
\\001\000\001\000\000\000\000\000\
\\001\000\001\000\097\000\005\000\097\000\007\000\097\000\009\000\097\000\
\\015\000\021\000\016\000\020\000\017\000\019\000\018\000\018\000\
\\037\000\097\000\038\000\097\000\042\000\097\000\043\000\097\000\
\\044\000\097\000\000\000\
\\001\000\001\000\098\000\005\000\098\000\007\000\098\000\009\000\098\000\
\\015\000\021\000\016\000\020\000\017\000\019\000\018\000\018\000\
\\037\000\098\000\038\000\098\000\042\000\098\000\043\000\098\000\
\\044\000\098\000\000\000\
\\001\000\001\000\099\000\005\000\099\000\007\000\099\000\009\000\099\000\
\\015\000\021\000\016\000\020\000\017\000\019\000\018\000\018\000\
\\037\000\099\000\038\000\099\000\042\000\099\000\043\000\099\000\
\\044\000\099\000\000\000\
\\001\000\001\000\100\000\005\000\100\000\007\000\100\000\009\000\100\000\
\\015\000\021\000\016\000\020\000\017\000\019\000\018\000\018\000\
\\037\000\100\000\038\000\100\000\042\000\100\000\043\000\100\000\
\\044\000\100\000\000\000\
\\001\000\001\000\101\000\005\000\101\000\007\000\101\000\009\000\101\000\
\\015\000\021\000\016\000\020\000\017\000\019\000\018\000\018\000\
\\037\000\101\000\038\000\101\000\042\000\101\000\043\000\101\000\
\\044\000\101\000\000\000\
\\001\000\001\000\102\000\005\000\102\000\007\000\102\000\009\000\102\000\
\\015\000\021\000\016\000\020\000\017\000\019\000\018\000\018\000\
\\037\000\102\000\038\000\102\000\042\000\102\000\043\000\102\000\
\\044\000\102\000\000\000\
\\001\000\002\000\010\000\003\000\009\000\004\000\008\000\016\000\007\000\
\\036\000\006\000\038\000\056\000\041\000\005\000\000\000\
\\001\000\002\000\010\000\003\000\009\000\004\000\008\000\016\000\007\000\
\\036\000\006\000\041\000\005\000\000\000\
\\001\000\002\000\049\000\000\000\
\\001\000\002\000\050\000\000\000\
\\001\000\002\000\051\000\000\000\
\\001\000\002\000\066\000\000\000\
\\001\000\002\000\068\000\000\000\
\\001\000\002\000\071\000\000\000\
\\001\000\002\000\081\000\000\000\
\\001\000\002\000\082\000\000\000\
\\001\000\006\000\059\000\027\000\058\000\000\000\
\\001\000\006\000\077\000\000\000\
\\001\000\006\000\079\000\000\000\
\\001\000\008\000\060\000\000\000\
\\001\000\009\000\061\000\000\000\
\\001\000\009\000\075\000\000\000\
\\001\000\019\000\057\000\000\000\
\\001\000\019\000\083\000\000\000\
\\001\000\027\000\074\000\000\000\
\\001\000\037\000\046\000\000\000\
\\001\000\038\000\063\000\000\000\
\\001\000\042\000\031\000\043\000\030\000\044\000\029\000\000\000\
\\086\000\015\000\021\000\016\000\020\000\017\000\019\000\018\000\018\000\
\\019\000\017\000\020\000\016\000\021\000\015\000\022\000\014\000\
\\023\000\013\000\024\000\012\000\000\000\
\\087\000\027\000\011\000\000\000\
\\088\000\000\000\
\\089\000\000\000\
\\090\000\000\000\
\\091\000\000\000\
\\092\000\000\000\
\\093\000\017\000\019\000\018\000\018\000\000\000\
\\094\000\017\000\019\000\018\000\018\000\000\000\
\\095\000\000\000\
\\096\000\000\000\
\\103\000\015\000\021\000\016\000\020\000\017\000\019\000\018\000\018\000\
\\019\000\017\000\020\000\016\000\021\000\015\000\022\000\014\000\
\\023\000\013\000\024\000\012\000\000\000\
\\104\000\000\000\
\\105\000\000\000\
\\106\000\005\000\062\000\015\000\021\000\016\000\020\000\017\000\019\000\
\\018\000\018\000\019\000\017\000\020\000\016\000\021\000\015\000\
\\022\000\014\000\023\000\013\000\024\000\012\000\000\000\
\\107\000\000\000\
\\108\000\008\000\033\000\000\000\
\\109\000\042\000\031\000\043\000\030\000\044\000\029\000\000\000\
\\110\000\000\000\
\\111\000\000\000\
\\112\000\000\000\
\\113\000\000\000\
\\114\000\015\000\021\000\016\000\020\000\017\000\019\000\018\000\018\000\
\\019\000\017\000\020\000\016\000\021\000\015\000\022\000\014\000\
\\023\000\013\000\024\000\012\000\000\000\
\\115\000\015\000\021\000\016\000\020\000\017\000\019\000\018\000\018\000\
\\019\000\017\000\020\000\016\000\021\000\015\000\022\000\014\000\
\\023\000\013\000\024\000\012\000\000\000\
\\116\000\044\000\029\000\000\000\
\\117\000\000\000\
\\118\000\000\000\
\\119\000\000\000\
\\120\000\005\000\076\000\000\000\
\\121\000\000\000\
\\122\000\000\000\
\\123\000\007\000\064\000\015\000\021\000\016\000\020\000\017\000\019\000\
\\018\000\018\000\019\000\017\000\020\000\016\000\021\000\015\000\
\\022\000\014\000\023\000\013\000\024\000\012\000\000\000\
\\124\000\000\000\
\\125\000\042\000\031\000\000\000\
\\126\000\000\000\
\\127\000\015\000\021\000\016\000\020\000\017\000\019\000\018\000\018\000\
\\019\000\017\000\020\000\016\000\021\000\015\000\022\000\014\000\
\\023\000\013\000\024\000\012\000\000\000\
\"
val actionRowNumbers =
"\008\000\030\000\029\000\033\000\
\\028\000\008\000\035\000\034\000\
\\045\000\008\000\008\000\008\000\
\\008\000\008\000\008\000\008\000\
\\008\000\008\000\008\000\008\000\
\\050\000\062\000\026\000\046\000\
\\053\000\049\000\048\000\009\000\
\\010\000\011\000\032\000\008\000\
\\040\000\005\000\006\000\003\000\
\\004\000\002\000\001\000\039\000\
\\038\000\037\000\036\000\063\000\
\\007\000\047\000\054\000\023\000\
\\017\000\020\000\021\000\043\000\
\\027\000\060\000\041\000\012\000\
\\008\000\013\000\014\000\031\000\
\\008\000\042\000\008\000\055\000\
\\056\000\051\000\025\000\022\000\
\\057\000\018\000\044\000\061\000\
\\008\000\019\000\014\000\015\000\
\\052\000\016\000\058\000\059\000\
\\024\000\008\000\064\000\000\000"
val gotoT =
"\
\\001\000\002\000\002\000\083\000\003\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\004\000\026\000\005\000\025\000\006\000\024\000\008\000\023\000\
\\009\000\022\000\012\000\021\000\013\000\020\000\000\000\
\\001\000\030\000\003\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\032\000\003\000\001\000\000\000\
\\001\000\033\000\003\000\001\000\000\000\
\\001\000\034\000\003\000\001\000\000\000\
\\001\000\035\000\003\000\001\000\000\000\
\\001\000\036\000\003\000\001\000\000\000\
\\001\000\037\000\003\000\001\000\000\000\
\\001\000\038\000\003\000\001\000\000\000\
\\001\000\039\000\003\000\001\000\000\000\
\\001\000\040\000\003\000\001\000\000\000\
\\001\000\041\000\003\000\001\000\000\000\
\\001\000\042\000\003\000\001\000\000\000\
\\000\000\
\\012\000\021\000\013\000\043\000\000\000\
\\000\000\
\\004\000\026\000\005\000\025\000\006\000\024\000\008\000\023\000\
\\009\000\045\000\012\000\021\000\013\000\020\000\000\000\
\\005\000\046\000\006\000\024\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\051\000\003\000\001\000\011\000\050\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\053\000\003\000\001\000\010\000\052\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\007\000\063\000\000\000\
\\001\000\065\000\003\000\001\000\000\000\
\\000\000\
\\014\000\068\000\015\000\067\000\000\000\
\\000\000\
\\001\000\051\000\003\000\001\000\011\000\070\000\000\000\
\\000\000\
\\001\000\053\000\003\000\001\000\010\000\071\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\076\000\003\000\001\000\000\000\
\\000\000\
\\014\000\068\000\015\000\078\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\082\000\003\000\001\000\000\000\
\\000\000\
\\000\000\
\"
val numstates = 84
val numrules = 42
val s = ref "" and index = ref 0
val string_to_int = fn () => 
let val i = !index
in index := i+2; Char.ord(String.sub(!s,i)) + Char.ord(String.sub(!s,i+1)) * 256
end
val string_to_list = fn s' =>
    let val len = String.size s'
        fun f () =
           if !index < len then string_to_int() :: f()
           else nil
   in index := 0; s := s'; f ()
   end
val string_to_pairlist = fn (conv_key,conv_entry) =>
     let fun f () =
         case string_to_int()
         of 0 => EMPTY
          | n => PAIR(conv_key (n-1),conv_entry (string_to_int()),f())
     in f
     end
val string_to_pairlist_default = fn (conv_key,conv_entry) =>
    let val conv_row = string_to_pairlist(conv_key,conv_entry)
    in fn () =>
       let val default = conv_entry(string_to_int())
           val row = conv_row()
       in (row,default)
       end
   end
val string_to_table = fn (convert_row,s') =>
    let val len = String.size s'
        fun f ()=
           if !index < len then convert_row() :: f()
           else nil
     in (s := s'; index := 0; f ())
     end
local
  val memo = Array.array(numstates+numrules,ERROR)
  val _ =let fun g i=(Array.update(memo,i,REDUCE(i-numstates)); g(i+1))
       fun f i =
            if i=numstates then g i
            else (Array.update(memo,i,SHIFT (STATE i)); f (i+1))
          in f 0 handle General.Subscript => ()
          end
in
val entry_to_action = fn 0 => ACCEPT | 1 => ERROR | j => Array.sub(memo,(j-2))
end
val gotoT=Array.fromList(string_to_table(string_to_pairlist(NT,STATE),gotoT))
val actionRows=string_to_table(string_to_pairlist_default(T,entry_to_action),actionRows)
val actionRowNumbers = string_to_list actionRowNumbers
val actionT = let val actionRowLookUp=
let val a=Array.fromList(actionRows) in fn i=>Array.sub(a,i) end
in Array.fromList(List.map actionRowLookUp actionRowNumbers)
end
in LrTable.mkLrTable {actions=actionT,gotos=gotoT,numRules=numrules,
numStates=numstates,initialState=STATE 0}
end
end
local open Header in
type pos = int
type arg = unit
structure MlyValue = 
struct
datatype svalue = VOID | ntVOID of unit ->  unit
 | STRING of unit ->  (string) | INT of unit ->  (int)
 | ID of unit ->  (string) | tyfields of unit ->  (A.field list)
 | tyfield of unit ->  (A.field) | funseq of unit ->  (A.fundec list)
 | fundec of unit ->  (A.fundec) | explist of unit ->  (A.exp list)
 | expseq of unit ->  ( ( A.exp * pos )  list)
 | declist of unit ->  (A.dec list) | dec of unit ->  (A.dec)
 | ty of unit ->  (A.ty)
 | tydec of unit ->  ({ name:Symbol.symbol,ty:A.ty,pos:pos } )
 | tyseq of unit ->  ({ name:Symbol.symbol,ty:A.ty,pos:pos }  list)
 | vardec of unit ->  (A.dec) | lvalue of unit ->  (A.var)
 | program of unit ->  (A.exp) | exp of unit ->  (A.exp)
end
type svalue = MlyValue.svalue
type result = A.exp
end
structure EC=
struct
open LrTable
infix 5 $$
fun x $$ y = y::x
val is_keyword =
fn (T 31) => true | (T 32) => true | (T 33) => true | (T 39) => true
 | (T 35) => true | (T 36) => true | (T 37) => true | (T 41) => true
 | (T 42) => true | (T 43) => true | (T 27) => true | (T 28) => true
 | (T 29) => true | (T 30) => true | (T 34) => true | (T 38) => true
 | (T 40) => true | _ => false
val preferred_change : (term list * term list) list = 
(nil
,nil
 $$ (T 29))::
(nil
,nil
 $$ (T 30))::
(nil
,nil
 $$ (T 7))::
nil
val noShift = 
fn (T 0) => true | _ => false
val showTerminal =
fn (T 0) => "EOF"
  | (T 1) => "ID"
  | (T 2) => "INT"
  | (T 3) => "STRING"
  | (T 4) => "COMMA"
  | (T 5) => "COLON"
  | (T 6) => "SEMICOLON"
  | (T 7) => "LPAREN"
  | (T 8) => "RPAREN"
  | (T 9) => "LBRACK"
  | (T 10) => "RBRACK"
  | (T 11) => "LBRACE"
  | (T 12) => "RBRACE"
  | (T 13) => "DOT"
  | (T 14) => "PLUS"
  | (T 15) => "MINUS"
  | (T 16) => "TIMES"
  | (T 17) => "DIVIDE"
  | (T 18) => "EQ"
  | (T 19) => "NEQ"
  | (T 20) => "LT"
  | (T 21) => "LE"
  | (T 22) => "GT"
  | (T 23) => "GE"
  | (T 24) => "AND"
  | (T 25) => "OR"
  | (T 26) => "ASSIGN"
  | (T 27) => "ARRAY"
  | (T 28) => "IF"
  | (T 29) => "THEN"
  | (T 30) => "ELSE"
  | (T 31) => "WHILE"
  | (T 32) => "FOR"
  | (T 33) => "TO"
  | (T 34) => "DO"
  | (T 35) => "LET"
  | (T 36) => "IN"
  | (T 37) => "END"
  | (T 38) => "OF"
  | (T 39) => "BREAK"
  | (T 40) => "NIL"
  | (T 41) => "FUNCTION"
  | (T 42) => "VAR"
  | (T 43) => "TYPE"
  | (T 44) => "UMINUS"
  | _ => "bogus-term"
local open Header in
val errtermvalue=
fn (T 1) => MlyValue.ID(fn () => ("bogus")) | 
(T 2) => MlyValue.INT(fn () => (1)) | 
(T 3) => MlyValue.STRING(fn () => ("")) | 
_ => MlyValue.VOID
end
val terms : term list = nil
 $$ (T 44) $$ (T 43) $$ (T 42) $$ (T 41) $$ (T 40) $$ (T 39) $$ (T 38)
 $$ (T 37) $$ (T 36) $$ (T 35) $$ (T 34) $$ (T 33) $$ (T 32) $$ (T 31)
 $$ (T 30) $$ (T 29) $$ (T 28) $$ (T 27) $$ (T 26) $$ (T 25) $$ (T 24)
 $$ (T 23) $$ (T 22) $$ (T 21) $$ (T 20) $$ (T 19) $$ (T 18) $$ (T 17)
 $$ (T 16) $$ (T 15) $$ (T 14) $$ (T 13) $$ (T 12) $$ (T 11) $$ (T 10)
 $$ (T 9) $$ (T 8) $$ (T 7) $$ (T 6) $$ (T 5) $$ (T 4) $$ (T 0)end
structure Actions =
struct 
exception mlyAction of int
local open Header in
val actions = 
fn (i392,defaultPos,stack,
    (()):arg) =>
case (i392,stack)
of  ( 0, ( ( _, ( MlyValue.exp exp1, exp1left, exp1right)) :: rest671)
) => let val  result = MlyValue.program (fn _ => let val  (exp as exp1
) = exp1 ()
 in (exp)
end)
 in ( LrTable.NT 1, ( result, exp1left, exp1right), rest671)
end
|  ( 1, ( ( _, ( MlyValue.lvalue lvalue1, lvalue1left, lvalue1right))
 :: rest671)) => let val  result = MlyValue.exp (fn _ => let val  (
lvalue as lvalue1) = lvalue1 ()
 in (A.VarExp lvalue)
end)
 in ( LrTable.NT 0, ( result, lvalue1left, lvalue1right), rest671)
end
|  ( 2, ( ( _, ( _, _, RPAREN1right)) :: ( _, ( MlyValue.explist 
explist1, _, _)) :: _ :: ( _, ( MlyValue.ID ID1, (IDleft as ID1left),
 _)) :: rest671)) => let val  result = MlyValue.exp (fn _ => let val 
 (ID as ID1) = ID1 ()
 val  (explist as explist1) = explist1 ()
 in (A.CallExp  {func=Symbol.symbol ID, args=explist, pos=IDleft})
end
)
 in ( LrTable.NT 0, ( result, ID1left, RPAREN1right), rest671)
end
|  ( 3, ( ( _, ( MlyValue.exp exp1, _, exp1right)) :: ( _, ( _, (
MINUSleft as MINUS1left), _)) :: rest671)) => let val  result = 
MlyValue.exp (fn _ => let val  (exp as exp1) = exp1 ()
 in (
A.OpExp {left=A.IntExp ~1, oper=A.TimesOp, right=exp, pos=MINUSleft})

end)
 in ( LrTable.NT 0, ( result, MINUS1left, exp1right), rest671)
end
|  ( 4, ( ( _, ( _, NIL1left, NIL1right)) :: rest671)) => let val  
result = MlyValue.exp (fn _ => (A.NilExp))
 in ( LrTable.NT 0, ( result, NIL1left, NIL1right), rest671)
end
|  ( 5, ( ( _, ( MlyValue.INT INT1, INT1left, INT1right)) :: rest671))
 => let val  result = MlyValue.exp (fn _ => let val  (INT as INT1) = 
INT1 ()
 in (A.IntExp INT)
end)
 in ( LrTable.NT 0, ( result, INT1left, INT1right), rest671)
end
|  ( 6, ( ( _, ( MlyValue.STRING STRING1, (STRINGleft as STRING1left),
 STRING1right)) :: rest671)) => let val  result = MlyValue.exp (fn _
 => let val  (STRING as STRING1) = STRING1 ()
 in (A.StringExp (STRING, STRINGleft))
end)
 in ( LrTable.NT 0, ( result, STRING1left, STRING1right), rest671)
end
|  ( 7, ( ( _, ( MlyValue.exp exp2, _, exp2right)) :: ( _, ( _, 
PLUSleft, _)) :: ( _, ( MlyValue.exp exp1, exp1left, _)) :: rest671))
 => let val  result = MlyValue.exp (fn _ => let val  exp1 = exp1 ()
 val  exp2 = exp2 ()
 in (A.OpExp {left=exp1, oper=A.PlusOp, right=exp2, pos=PLUSleft})
end
)
 in ( LrTable.NT 0, ( result, exp1left, exp2right), rest671)
end
|  ( 8, ( ( _, ( MlyValue.exp exp2, _, exp2right)) :: ( _, ( _, 
MINUSleft, _)) :: ( _, ( MlyValue.exp exp1, exp1left, _)) :: rest671))
 => let val  result = MlyValue.exp (fn _ => let val  exp1 = exp1 ()
 val  exp2 = exp2 ()
 in (A.OpExp {left=exp1, oper=A.MinusOp, right=exp2, pos=MINUSleft})

end)
 in ( LrTable.NT 0, ( result, exp1left, exp2right), rest671)
end
|  ( 9, ( ( _, ( MlyValue.exp exp2, _, exp2right)) :: ( _, ( _, 
TIMESleft, _)) :: ( _, ( MlyValue.exp exp1, exp1left, _)) :: rest671))
 => let val  result = MlyValue.exp (fn _ => let val  exp1 = exp1 ()
 val  exp2 = exp2 ()
 in (A.OpExp {left=exp1, oper=A.TimesOp, right=exp2, pos=TIMESleft})

end)
 in ( LrTable.NT 0, ( result, exp1left, exp2right), rest671)
end
|  ( 10, ( ( _, ( MlyValue.exp exp2, _, exp2right)) :: ( _, ( _, 
DIVIDEleft, _)) :: ( _, ( MlyValue.exp exp1, exp1left, _)) :: rest671)
) => let val  result = MlyValue.exp (fn _ => let val  exp1 = exp1 ()
 val  exp2 = exp2 ()
 in (A.OpExp {left=exp1, oper=A.DivideOp, right=exp2, pos=DIVIDEleft})

end)
 in ( LrTable.NT 0, ( result, exp1left, exp2right), rest671)
end
|  ( 11, ( ( _, ( MlyValue.exp exp2, _, exp2right)) :: _ :: ( _, ( 
MlyValue.exp exp1, exp1left, _)) :: rest671)) => let val  result = 
MlyValue.exp (fn _ => let val  exp1 = exp1 ()
 val  exp2 = exp2 ()
 in (A.OpExp {left=exp1, oper=A.EqOp, right=exp2, pos=exp1left})
end)
 in ( LrTable.NT 0, ( result, exp1left, exp2right), rest671)
end
|  ( 12, ( ( _, ( MlyValue.exp exp2, _, exp2right)) :: _ :: ( _, ( 
MlyValue.exp exp1, exp1left, _)) :: rest671)) => let val  result = 
MlyValue.exp (fn _ => let val  exp1 = exp1 ()
 val  exp2 = exp2 ()
 in (A.OpExp {left=exp1, oper=A.NeqOp, right=exp2, pos=exp1left})
end)
 in ( LrTable.NT 0, ( result, exp1left, exp2right), rest671)
end
|  ( 13, ( ( _, ( MlyValue.exp exp2, _, exp2right)) :: _ :: ( _, ( 
MlyValue.exp exp1, exp1left, _)) :: rest671)) => let val  result = 
MlyValue.exp (fn _ => let val  exp1 = exp1 ()
 val  exp2 = exp2 ()
 in (A.OpExp {left=exp1, oper=A.LeOp, right=exp2, pos=exp1left})
end)
 in ( LrTable.NT 0, ( result, exp1left, exp2right), rest671)
end
|  ( 14, ( ( _, ( MlyValue.exp exp2, _, exp2right)) :: _ :: ( _, ( 
MlyValue.exp exp1, exp1left, _)) :: rest671)) => let val  result = 
MlyValue.exp (fn _ => let val  exp1 = exp1 ()
 val  exp2 = exp2 ()
 in (A.OpExp {left=exp1, oper=A.LtOp, right=exp2, pos=exp1left})
end)
 in ( LrTable.NT 0, ( result, exp1left, exp2right), rest671)
end
|  ( 15, ( ( _, ( MlyValue.exp exp2, _, exp2right)) :: _ :: ( _, ( 
MlyValue.exp exp1, exp1left, _)) :: rest671)) => let val  result = 
MlyValue.exp (fn _ => let val  exp1 = exp1 ()
 val  exp2 = exp2 ()
 in (A.OpExp {left=exp1, oper=A.GeOp, right=exp2, pos=exp1left})
end)
 in ( LrTable.NT 0, ( result, exp1left, exp2right), rest671)
end
|  ( 16, ( ( _, ( MlyValue.exp exp2, _, exp2right)) :: _ :: ( _, ( 
MlyValue.exp exp1, exp1left, _)) :: rest671)) => let val  result = 
MlyValue.exp (fn _ => let val  exp1 = exp1 ()
 val  exp2 = exp2 ()
 in (A.OpExp {left=exp1, oper=A.GtOp, right=exp2, pos=exp1left})
end)
 in ( LrTable.NT 0, ( result, exp1left, exp2right), rest671)
end
|  ( 17, ( ( _, ( MlyValue.exp exp1, _, exp1right)) :: _ :: ( _, ( 
MlyValue.lvalue lvalue1, (lvalueleft as lvalue1left), _)) :: rest671))
 => let val  result = MlyValue.exp (fn _ => let val  (lvalue as 
lvalue1) = lvalue1 ()
 val  (exp as exp1) = exp1 ()
 in (A.AssignExp {var=lvalue, exp=exp, pos=lvalueleft})
end)
 in ( LrTable.NT 0, ( result, lvalue1left, exp1right), rest671)
end
|  ( 18, ( ( _, ( _, _, END1right)) :: _ :: ( _, ( MlyValue.declist 
declist1, _, _)) :: ( _, ( _, (LETleft as LET1left), _)) :: rest671))
 => let val  result = MlyValue.exp (fn _ => let val  (declist as 
declist1) = declist1 ()
 in (A.LetExp {decs=declist, body=A.SeqExp([]), pos=LETleft})
end)
 in ( LrTable.NT 0, ( result, LET1left, END1right), rest671)
end
|  ( 19, ( ( _, ( _, _, END1right)) :: ( _, ( MlyValue.expseq expseq1,
 _, _)) :: _ :: ( _, ( MlyValue.declist declist1, _, _)) :: ( _, ( _,
 (LETleft as LET1left), _)) :: rest671)) => let val  result = 
MlyValue.exp (fn _ => let val  (declist as declist1) = declist1 ()
 val  (expseq as expseq1) = expseq1 ()
 in (A.LetExp {decs=declist, body=A.SeqExp(expseq), pos=LETleft})
end)
 in ( LrTable.NT 0, ( result, LET1left, END1right), rest671)
end
|  ( 20, ( ( _, ( MlyValue.exp exp1, exp1left, exp1right)) :: rest671)
) => let val  result = MlyValue.explist (fn _ => let val  (exp as exp1
) = exp1 ()
 in (exp::nil)
end)
 in ( LrTable.NT 10, ( result, exp1left, exp1right), rest671)
end
|  ( 21, ( ( _, ( MlyValue.explist explist1, _, explist1right)) :: _
 :: ( _, ( MlyValue.exp exp1, exp1left, _)) :: rest671)) => let val  
result = MlyValue.explist (fn _ => let val  (exp as exp1) = exp1 ()
 val  (explist as explist1) = explist1 ()
 in (exp::explist)
end)
 in ( LrTable.NT 10, ( result, exp1left, explist1right), rest671)
end
|  ( 22, ( ( _, ( MlyValue.ID ID1, (IDleft as ID1left), ID1right)) :: 
rest671)) => let val  result = MlyValue.lvalue (fn _ => let val  (ID
 as ID1) = ID1 ()
 in (A.SimpleVar(Symbol.symbol ID, IDleft))
end)
 in ( LrTable.NT 2, ( result, ID1left, ID1right), rest671)
end
|  ( 23, ( ( _, ( MlyValue.dec dec1, dec1left, dec1right)) :: rest671)
) => let val  result = MlyValue.declist (fn _ => let val  (dec as dec1
) = dec1 ()
 in (dec :: nil)
end)
 in ( LrTable.NT 8, ( result, dec1left, dec1right), rest671)
end
|  ( 24, ( ( _, ( MlyValue.declist declist1, _, declist1right)) :: ( _
, ( MlyValue.dec dec1, dec1left, _)) :: rest671)) => let val  result =
 MlyValue.declist (fn _ => let val  (dec as dec1) = dec1 ()
 val  (declist as declist1) = declist1 ()
 in (dec :: declist)
end)
 in ( LrTable.NT 8, ( result, dec1left, declist1right), rest671)
end
|  ( 25, ( ( _, ( MlyValue.vardec vardec1, vardec1left, vardec1right))
 :: rest671)) => let val  result = MlyValue.dec (fn _ => let val  (
vardec as vardec1) = vardec1 ()
 in (vardec)
end)
 in ( LrTable.NT 7, ( result, vardec1left, vardec1right), rest671)
end
|  ( 26, ( ( _, ( MlyValue.tyseq tyseq1, tyseq1left, tyseq1right)) :: 
rest671)) => let val  result = MlyValue.dec (fn _ => let val  (tyseq
 as tyseq1) = tyseq1 ()
 in (A.TypeDec tyseq)
end)
 in ( LrTable.NT 7, ( result, tyseq1left, tyseq1right), rest671)
end
|  ( 27, ( ( _, ( MlyValue.funseq funseq1, funseq1left, funseq1right))
 :: rest671)) => let val  result = MlyValue.dec (fn _ => let val  (
funseq as funseq1) = funseq1 ()
 in (A.FunctionDec funseq)
end)
 in ( LrTable.NT 7, ( result, funseq1left, funseq1right), rest671)
end
|  ( 28, ( ( _, ( MlyValue.exp exp1, _, exp1right)) :: _ :: ( _, ( 
MlyValue.ID ID1, _, _)) :: ( _, ( _, (VARleft as VAR1left), _)) :: 
rest671)) => let val  result = MlyValue.vardec (fn _ => let val  (ID
 as ID1) = ID1 ()
 val  (exp as exp1) = exp1 ()
 in (
A.VarDec {name=Symbol.symbol ID, init=exp,
                           pos=VARleft, escape= ref true, typ=NONE}
)
end)
 in ( LrTable.NT 3, ( result, VAR1left, exp1right), rest671)
end
|  ( 29, ( ( _, ( MlyValue.exp exp1, _, exp1right)) :: _ :: ( _, ( 
MlyValue.ID ID2, ID2left, _)) :: _ :: ( _, ( MlyValue.ID ID1, _, _))
 :: ( _, ( _, (VARleft as VAR1left), _)) :: rest671)) => let val  
result = MlyValue.vardec (fn _ => let val  ID1 = ID1 ()
 val  ID2 = ID2 ()
 val  (exp as exp1) = exp1 ()
 in (
A.VarDec {name=Symbol.symbol ID1, init=exp,
                                    pos=VARleft, escape= ref true,
                                    typ=SOME (Symbol.symbol ID2, ID2left)}
)
end)
 in ( LrTable.NT 3, ( result, VAR1left, exp1right), rest671)
end
|  ( 30, ( ( _, ( MlyValue.tydec tydec1, tydec1left, tydec1right)) :: 
rest671)) => let val  result = MlyValue.tyseq (fn _ => let val  (tydec
 as tydec1) = tydec1 ()
 in (tydec::nil)
end)
 in ( LrTable.NT 4, ( result, tydec1left, tydec1right), rest671)
end
|  ( 31, ( ( _, ( MlyValue.tyseq tyseq1, _, tyseq1right)) :: ( _, ( 
MlyValue.tydec tydec1, tydec1left, _)) :: rest671)) => let val  result
 = MlyValue.tyseq (fn _ => let val  (tydec as tydec1) = tydec1 ()
 val  (tyseq as tyseq1) = tyseq1 ()
 in (tydec::tyseq)
end)
 in ( LrTable.NT 4, ( result, tydec1left, tyseq1right), rest671)
end
|  ( 32, ( ( _, ( MlyValue.ty ty1, _, ty1right)) :: _ :: ( _, ( 
MlyValue.ID ID1, _, _)) :: ( _, ( _, (TYPEleft as TYPE1left), _)) :: 
rest671)) => let val  result = MlyValue.tydec (fn _ => let val  (ID
 as ID1) = ID1 ()
 val  (ty as ty1) = ty1 ()
 in ({name=Symbol.symbol ID, ty=ty, pos=TYPEleft})
end)
 in ( LrTable.NT 5, ( result, TYPE1left, ty1right), rest671)
end
|  ( 33, ( ( _, ( MlyValue.ID ID1, (IDleft as ID1left), ID1right)) :: 
rest671)) => let val  result = MlyValue.ty (fn _ => let val  (ID as 
ID1) = ID1 ()
 in (A.NameTy (Symbol.symbol ID, IDleft))
end)
 in ( LrTable.NT 6, ( result, ID1left, ID1right), rest671)
end
|  ( 34, ( ( _, ( MlyValue.tyfield tyfield1, tyfield1left, 
tyfield1right)) :: rest671)) => let val  result = MlyValue.tyfields
 (fn _ => let val  (tyfield as tyfield1) = tyfield1 ()
 in (tyfield::nil)
end)
 in ( LrTable.NT 14, ( result, tyfield1left, tyfield1right), rest671)

end
|  ( 35, ( ( _, ( MlyValue.tyfields tyfields1, _, tyfields1right)) ::
 _ :: ( _, ( MlyValue.tyfield tyfield1, tyfield1left, _)) :: rest671))
 => let val  result = MlyValue.tyfields (fn _ => let val  (tyfield as 
tyfield1) = tyfield1 ()
 val  (tyfields as tyfields1) = tyfields1 ()
 in (tyfield::tyfields)
end)
 in ( LrTable.NT 14, ( result, tyfield1left, tyfields1right), rest671)

end
|  ( 36, ( ( _, ( MlyValue.ID ID2, _, ID2right)) :: _ :: ( _, ( 
MlyValue.ID ID1, ID1left, _)) :: rest671)) => let val  result = 
MlyValue.tyfield (fn _ => let val  ID1 = ID1 ()
 val  ID2 = ID2 ()
 in (
{name = Symbol.symbol ID1,
  escape=ref true,
  typ=Symbol.symbol ID2,
  pos=ID1left}
)
end)
 in ( LrTable.NT 13, ( result, ID1left, ID2right), rest671)
end
|  ( 37, ( ( _, ( MlyValue.exp exp1, (expleft as exp1left), exp1right)
) :: rest671)) => let val  result = MlyValue.expseq (fn _ => let val 
 (exp as exp1) = exp1 ()
 in ((exp, expleft) :: nil)
end)
 in ( LrTable.NT 9, ( result, exp1left, exp1right), rest671)
end
|  ( 38, ( ( _, ( MlyValue.expseq expseq1, _, expseq1right)) :: _ :: (
 _, ( MlyValue.exp exp1, (expleft as exp1left), _)) :: rest671)) =>
 let val  result = MlyValue.expseq (fn _ => let val  (exp as exp1) = 
exp1 ()
 val  (expseq as expseq1) = expseq1 ()
 in ((exp, expleft) :: expseq)
end)
 in ( LrTable.NT 9, ( result, exp1left, expseq1right), rest671)
end
|  ( 39, ( ( _, ( MlyValue.fundec fundec1, fundec1left, fundec1right))
 :: rest671)) => let val  result = MlyValue.funseq (fn _ => let val  (
fundec as fundec1) = fundec1 ()
 in (fundec::nil)
end)
 in ( LrTable.NT 12, ( result, fundec1left, fundec1right), rest671)

end
|  ( 40, ( ( _, ( MlyValue.funseq funseq1, _, funseq1right)) :: ( _, (
 MlyValue.fundec fundec1, fundec1left, _)) :: rest671)) => let val  
result = MlyValue.funseq (fn _ => let val  (fundec as fundec1) = 
fundec1 ()
 val  (funseq as funseq1) = funseq1 ()
 in (fundec::funseq)
end)
 in ( LrTable.NT 12, ( result, fundec1left, funseq1right), rest671)

end
|  ( 41, ( ( _, ( MlyValue.exp exp1, _, exp1right)) :: _ :: ( _, ( 
MlyValue.ID ID2, ID2left, _)) :: _ :: _ :: ( _, ( MlyValue.tyfields 
tyfields1, _, _)) :: _ :: ( _, ( MlyValue.ID ID1, _, _)) :: ( _, ( _,
 (FUNCTIONleft as FUNCTION1left), _)) :: rest671)) => let val  result
 = MlyValue.fundec (fn _ => let val  ID1 = ID1 ()
 val  (tyfields as tyfields1) = tyfields1 ()
 val  ID2 = ID2 ()
 val  (exp as exp1) = exp1 ()
 in (
{name=Symbol.symbol ID1, params=tyfields,
                                     result=SOME(Symbol.symbol ID2, ID2left), body=exp, pos=FUNCTIONleft}
)
end)
 in ( LrTable.NT 11, ( result, FUNCTION1left, exp1right), rest671)
end
| _ => raise (mlyAction i392)
end
val void = MlyValue.VOID
val extract = fn a => (fn MlyValue.program x => x
| _ => let exception ParseInternal
	in raise ParseInternal end) a ()
end
end
structure Tokens : Tiger_TOKENS =
struct
type svalue = ParserData.svalue
type ('a,'b) token = ('a,'b) Token.token
fun EOF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 0,(
ParserData.MlyValue.VOID,p1,p2))
fun ID (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 1,(
ParserData.MlyValue.ID (fn () => i),p1,p2))
fun INT (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 2,(
ParserData.MlyValue.INT (fn () => i),p1,p2))
fun STRING (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 3,(
ParserData.MlyValue.STRING (fn () => i),p1,p2))
fun COMMA (p1,p2) = Token.TOKEN (ParserData.LrTable.T 4,(
ParserData.MlyValue.VOID,p1,p2))
fun COLON (p1,p2) = Token.TOKEN (ParserData.LrTable.T 5,(
ParserData.MlyValue.VOID,p1,p2))
fun SEMICOLON (p1,p2) = Token.TOKEN (ParserData.LrTable.T 6,(
ParserData.MlyValue.VOID,p1,p2))
fun LPAREN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 7,(
ParserData.MlyValue.VOID,p1,p2))
fun RPAREN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 8,(
ParserData.MlyValue.VOID,p1,p2))
fun LBRACK (p1,p2) = Token.TOKEN (ParserData.LrTable.T 9,(
ParserData.MlyValue.VOID,p1,p2))
fun RBRACK (p1,p2) = Token.TOKEN (ParserData.LrTable.T 10,(
ParserData.MlyValue.VOID,p1,p2))
fun LBRACE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 11,(
ParserData.MlyValue.VOID,p1,p2))
fun RBRACE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 12,(
ParserData.MlyValue.VOID,p1,p2))
fun DOT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 13,(
ParserData.MlyValue.VOID,p1,p2))
fun PLUS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 14,(
ParserData.MlyValue.VOID,p1,p2))
fun MINUS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 15,(
ParserData.MlyValue.VOID,p1,p2))
fun TIMES (p1,p2) = Token.TOKEN (ParserData.LrTable.T 16,(
ParserData.MlyValue.VOID,p1,p2))
fun DIVIDE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 17,(
ParserData.MlyValue.VOID,p1,p2))
fun EQ (p1,p2) = Token.TOKEN (ParserData.LrTable.T 18,(
ParserData.MlyValue.VOID,p1,p2))
fun NEQ (p1,p2) = Token.TOKEN (ParserData.LrTable.T 19,(
ParserData.MlyValue.VOID,p1,p2))
fun LT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 20,(
ParserData.MlyValue.VOID,p1,p2))
fun LE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 21,(
ParserData.MlyValue.VOID,p1,p2))
fun GT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 22,(
ParserData.MlyValue.VOID,p1,p2))
fun GE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 23,(
ParserData.MlyValue.VOID,p1,p2))
fun AND (p1,p2) = Token.TOKEN (ParserData.LrTable.T 24,(
ParserData.MlyValue.VOID,p1,p2))
fun OR (p1,p2) = Token.TOKEN (ParserData.LrTable.T 25,(
ParserData.MlyValue.VOID,p1,p2))
fun ASSIGN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 26,(
ParserData.MlyValue.VOID,p1,p2))
fun ARRAY (p1,p2) = Token.TOKEN (ParserData.LrTable.T 27,(
ParserData.MlyValue.VOID,p1,p2))
fun IF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 28,(
ParserData.MlyValue.VOID,p1,p2))
fun THEN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 29,(
ParserData.MlyValue.VOID,p1,p2))
fun ELSE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 30,(
ParserData.MlyValue.VOID,p1,p2))
fun WHILE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 31,(
ParserData.MlyValue.VOID,p1,p2))
fun FOR (p1,p2) = Token.TOKEN (ParserData.LrTable.T 32,(
ParserData.MlyValue.VOID,p1,p2))
fun TO (p1,p2) = Token.TOKEN (ParserData.LrTable.T 33,(
ParserData.MlyValue.VOID,p1,p2))
fun DO (p1,p2) = Token.TOKEN (ParserData.LrTable.T 34,(
ParserData.MlyValue.VOID,p1,p2))
fun LET (p1,p2) = Token.TOKEN (ParserData.LrTable.T 35,(
ParserData.MlyValue.VOID,p1,p2))
fun IN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 36,(
ParserData.MlyValue.VOID,p1,p2))
fun END (p1,p2) = Token.TOKEN (ParserData.LrTable.T 37,(
ParserData.MlyValue.VOID,p1,p2))
fun OF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 38,(
ParserData.MlyValue.VOID,p1,p2))
fun BREAK (p1,p2) = Token.TOKEN (ParserData.LrTable.T 39,(
ParserData.MlyValue.VOID,p1,p2))
fun NIL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 40,(
ParserData.MlyValue.VOID,p1,p2))
fun FUNCTION (p1,p2) = Token.TOKEN (ParserData.LrTable.T 41,(
ParserData.MlyValue.VOID,p1,p2))
fun VAR (p1,p2) = Token.TOKEN (ParserData.LrTable.T 42,(
ParserData.MlyValue.VOID,p1,p2))
fun TYPE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 43,(
ParserData.MlyValue.VOID,p1,p2))
fun UMINUS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 44,(
ParserData.MlyValue.VOID,p1,p2))
end
end
