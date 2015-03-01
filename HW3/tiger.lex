type pos = int
type lexresult = Tokens.token

val lineNum = ErrorMsg.lineNum
val linePos = ErrorMsg.linePos
fun err(p1,p2) = ErrorMsg.error p1


val count_comment = ref 0
val str_Tok = ref ""

fun eof() = let val pos = hd(!linePos) 
in 
	if !count_comment <> 0 
		then (ErrorMsg.error pos "unclosed comment") 
		else (); count_comment := 0; Tokens.EOF(pos,pos) 
end

%% 
%s COMMENT; 
%s STRING; 
%s ESCAPE;
%s FORMAT;
digit = [0-9];
letter = [A-Za-z];
myascii = {digit}{3};
to_ignore=[\t\ ]+;
format = {to_ignore}|\n;
controls = \^[@A-Z\\_\^];
%%

<INITIAL,COMMENT>\n => (lineNum := !lineNum+1; linePos := yypos :: !linePos; continue());
<INITIAL>" " => (continue());

<INITIAL>"*/" =>  (ErrorMsg.error yypos "nested comment mismatch"; eof()); 

<INITIAL>":=" => (Tokens.ASSIGN(yypos,yypos+2));
<INITIAL>"|" => (Tokens.OR(yypos,yypos+1));
<INITIAL>"&" => (Tokens.AND(yypos,yypos+1));
<INITIAL>">=" => (Tokens.GE(yypos,yypos+2));
<INITIAL>">" => (Tokens.GT(yypos,yypos+1));
<INITIAL>"<=" => (Tokens.LE(yypos,yypos+2));
<INITIAL>"<" => (Tokens.LT(yypos,yypos+1));
<INITIAL>"<>" => (Tokens.NEQ(yypos,yypos+2));
<INITIAL>"=" => (Tokens.EQ(yypos,yypos+1));


<INITIAL>"." => (Tokens.DOT(yypos,yypos+1));
<INITIAL>"{" => (Tokens.LBRACE(yypos,yypos+1));
<INITIAL>"}" => (Tokens.RBRACE(yypos,yypos+1));
<INITIAL>"[" => (Tokens.LBRACK(yypos,yypos+1));
<INITIAL>"]" => (Tokens.RBRACK(yypos,yypos+1));
<INITIAL>"(" => (Tokens.LPAREN(yypos,yypos+1));
<INITIAL>")" => (Tokens.RPAREN(yypos,yypos+1));

<INITIAL>";" => (Tokens.SEMICOLON(yypos,yypos+1));
<INITIAL>":" => (Tokens.COLON(yypos,yypos+1));
<INITIAL>"," => (Tokens.COMMA(yypos,yypos+1));


<INITIAL>"/" => (Tokens.DIVIDE(yypos,yypos+1));
<INITIAL>"*" => (Tokens.TIMES(yypos,yypos+1));
<INITIAL>"+" => (Tokens.PLUS(yypos,yypos+1));
<INITIAL>"-" => (Tokens.MINUS(yypos,yypos+1));

<INITIAL>type => (Tokens.TYPE(yypos,yypos+4));
<INITIAL>var => (Tokens.VAR(yypos,yypos+3));
<INITIAL>function => (Tokens.FUNCTION(yypos,yypos+8));
<INITIAL>break => (Tokens.BREAK(yypos,yypos+5));
<INITIAL>of => (Tokens.OF(yypos,yypos+2));
<INITIAL>end => (Tokens.END(yypos,yypos+3));
<INITIAL>in => (Tokens.IN(yypos,yypos+2));
<INITIAL>nil => (Tokens.NIL(yypos,yypos+3));
<INITIAL>let => (Tokens.LET(yypos,yypos+3));
<INITIAL>do => (Tokens.DO(yypos,yypos+2));
<INITIAL>to => (Tokens.TO(yypos,yypos+2));
<INITIAL>for => (Tokens.FOR(yypos,yypos+3));
<INITIAL>while => (Tokens.WHILE(yypos,yypos+5));
<INITIAL>else => (Tokens.ELSE(yypos,yypos+4));
<INITIAL>if => (Tokens.IF(yypos,yypos+2));
<INITIAL>then => (Tokens.THEN(yypos,yypos+4));
<INITIAL>array => (Tokens.ARRAY(yypos,yypos+5));

<INITIAL>\" => (str_Tok:=""; YYBEGIN STRING; continue());

<STRING>\" => (YYBEGIN INITIAL;Tokens.STRING(!str_Tok, yypos, yypos + size(!str_Tok)));
<STRING>"\\" => (YYBEGIN ESCAPE; continue());
<STRING>\n => (ErrorMsg.error yypos ("Invalid, tiger does not support newline in string " ^ yytext); eof());
<STRING>. => (str_Tok := !str_Tok ^ yytext; continue());

<ESCAPE> {controls} => (str_Tok := !str_Tok ^ "\\" ^ yytext; YYBEGIN STRING; continue());

<ESCAPE>"\\" => (str_Tok := !str_Tok ^ "\\"; YYBEGIN STRING; continue());
<ESCAPE>"n" => (str_Tok := !str_Tok ^ "\n"; YYBEGIN STRING; continue());
<ESCAPE>"t" => (str_Tok := !str_Tok ^ "\t"; YYBEGIN STRING; continue());
<ESCAPE>{myascii} => (str_Tok := !str_Tok ^ String.str(Char.chr(valOf(Int.fromString yytext)));
		   YYBEGIN STRING;
		   continue());
<ESCAPE>{format} => (YYBEGIN FORMAT; continue());
<ESCAPE>. => (ErrorMsg.error yypos ("Invalid, tiger does not support escape character in " ^ yytext); eof());

<FORMAT>{format} => (continue());
<FORMAT>"\\" => (YYBEGIN STRING; continue());
<FORMAT>. => (ErrorMsg.error yypos ("Invalid, tiger does not support format character in " ^ yytext); eof());


<INITIAL,COMMENT>"/*" => ( count_comment := !count_comment+1; YYBEGIN COMMENT; continue());
<COMMENT>"*/" => (count_comment := !count_comment-1;
		 if (!count_comment=0)
		 then (YYBEGIN INITIAL; continue())
		 else (continue()));
<COMMENT>. => (continue());


<INITIAL>{digit}+ => (Tokens.INT(valOf(Int.fromString yytext),yypos,yypos+size (yytext)));
<INITIAL>{letter}({letter}|_|{digit})* => (Tokens.ID(yytext,yypos,yypos+size(yytext)));

<INITIAL>. => (ErrorMsg.error yypos ("illegal character " ^ yytext); continue());

