#include "hpp.hpp"
#define YYERR "\n\n"<<yylineno<<":"<<msg<<"["<<yytext<<"]\n\n"
void yyerror(string msg) { cout<<YYERR; cerr<<YYERR; exit(-1); }
int main() { return yyparse(); }

Sym::Sym(string T,string V) { tag=T; val=V; }
Sym::Sym(string V):Sym("sym",V){}
void Sym::push(Sym*o) { nest.push_back(o); }

string Sym::head() { ostringstream os;
	os<<"<"+tag+":"+val+"> @"<<this; return os.str(); }
string Sym::pad(int n) { string S; for (int i=0;i<n;i++) S+='\t'; return S; }
string Sym::dump(int depth) { string S = "\n"+pad(depth)+head();
	for (auto it=lookup.begin(),e=lookup.end();it!=e;it++)
		S += "\n"+pad(depth+1) + it->first +" => " + it->second->head();
	for (auto it=nest.begin(),e=nest.end();it!=e;it++)
		S += (*it)->dump(depth+1);
	return S; }

Scalar::Scalar(string T,string V):Sym(T,V){}

Str::Str(string V):Scalar("str",V){}
Doc::Doc(string V):Str(V){ tag="doc"; }
string Str::head() { ostringstream os;
	os<<"<"<<tag<<":'"<<val<<"'> @"<<this; return os.str(); }

Num::Num(string V):Scalar("num",V){ val=atof(V.c_str()); }
string Num::head() { ostringstream os;
	os<<"<"<<tag<<":"<<val<<">"; return os.str(); }
	
Int::Int(string V):Scalar("int",V){ val=atoi(V.c_str()); }
string Int::head() { ostringstream os;
	os<<"<"<<tag<<":"<<val<<">"; return os.str(); }

Vector::Vector():Sym("vector","[]"){}
string Vector::head() { ostringstream os; os<<"[] @"<<this; return os.str(); }

Op::Op(string V):Sym("op",V){}

Dep::Dep(Sym*A,Sym*B,Sym*C):Sym("dep",A->val+":"+B->val+"->"+C->val) {
	push(A); push(B); push(C); }

