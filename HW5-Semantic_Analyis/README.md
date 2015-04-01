HW Completed as described [here](http://ccom.uprrp.edu/~humberto/pages/teaching/compilers/semantic.html).
Just the bare minimum is completed. 

To run a semantic analysis:

```
- CM.make "sources.cm";
[scanning sources.cm]
...
val it = true : bool
- Semant.transProg (Parse.parse "sum.tig");
val it = () : unit
- Semant.transProg (Parse.parse "plus.tig");
plus.tig:1.3:integer required
val it = () : unit
- Semant.transProg (Parse.parse "let.tig");
let.tig:6.4:integer required
val it = () : unit
- Semant.transProg (Parse.parse "let.tig");
val it = () : unit
```