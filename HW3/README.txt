README tiger.lex
Created by Edwardo S. Rivera Hazim


This is the README for tiger.lex for the Compilers Class.
Some .sig files are included that has some test on it.

1- Handleling Comments
I handled comments in the following way: a pointer variable count_comment is initialized to 0. This variable
is incremented if a "/*" is found and decremented if "*/" is found. This is done in the end of file function eof(). 
See comment.sig, comment_good.sig

A special case must be handled for nested comments, if a unbalanced nested comment that ends with "/*", this is handled with a case in <COMMENT> that gives a message error and calls eof() to finalize the execution fo the lexer. See comment_end.sig

When the lexer executes the special case, it gives the error message: "nested comment mismatch".
if is other error, it gives the error message: "unclosed comment" as denfined in eof().

Also, in the eof() the pointer variable is initialized again to 0 when eof() is used and/or called.

2- Handleling end of file
Some minor changes where done to the eof() function that were already mentioned.

3- Handleling strings
Strings are handleled using a state <STRING>. I use a pointer variable called str_Tok to construct the correct string. If inside this state (and the string), a "\" is found, it enter a new state <ESCAPE>. This escape state, has some escaping characters to convert. The ASCII Table works here ("\065" for example). Also, "\n" and "\t" works.

IMPORTANT: The format inside strings works in some tests, but I am not sure if it is correct. This is the state FORMAT. The "\^l" where l stands form some symbol in the reg. expression \^[@A-Z\\_\^] is not working, it constructs a string. SML has a strange behavior that, although I find the "source" of the error, I did not manage to fix it. The parser, if posible, should take care of this.

Illustration of error:
Using sml, the following code:

print("\^G")

does the alert beep (not in my machine right now but if you put other letter it does something) and not a string. But if you do:

val s = "\" ^ "^G"
print(s)

It prints the string "\^G" literally. Because I am constructing the string doing this type of append, it construct a string, not the right command.
