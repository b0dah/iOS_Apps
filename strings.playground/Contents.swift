import Cocoa

var myString = """
diam(N) :- findall(V, (edge(V,_);edge(_, V)),T),
    findall(P, (member(A, T), member(B,T), A=B, findMinPath(A,B,P)), L),
    maxPath(L, N).
    
findMinPath(A,B,P) :- findall(X, findPath(A,B,X),L), minPath(L,P), !.

findPath(A,B,P) :- findPath(A,B,[A],P).
findPath(A,A,P,P).
findPath(A,B,T,P) :- (edge(A,Z); edge(Z,A)), not(member(Z,T)), findPath(Z,B,[Z|T], P).

minPath([A], A):-!.
minPath([H|T], P) :- minPath(T,P1),!,length(H,N), length(P1, M), (N<M, P=H; P=P1).

maxPath([A], A):-!.
maxPath([H|T], P) :- maxPath(T,P1),!,length(H,N), length(P1, M), (N>M, P=H; P=P1).
"""
     
var rightString = """
diam(N):-findall(V, (edge(V, _);edge(_, V)), T), findall(P, (member(A, T), member(B, T), A=B, findminpath(A, B, P)), L), maxpath(L, N).

findminpath(A, B, P):-findall(X, findpath(A, B, X), L), minpath(L, P),!.

findpath(A, B, P):-findpath(A, B, [A], P).
findpath(A, A, P, P).
findpath(A, B, T, P):-(edge(A, Z);edge(Z, A)), not(member(Z, T)), findpath(Z, B, [Z|T], P).

minpath([A], A):-!.
minpath([H|T], P):-minpath(T, P1), !, length(H, N), length(P1, M), (N<M, P=H; P=P1).

maxpath([A], A):-!.
maxpath([H|T], P):-maxpath(T, P1), !, length(H, N), length(P1, M), (N>M, P=H; P=P1).
"""

func filterString(inputString: String) -> String {
    let separators = " \n\t\r"
    var trimmed = inputString.filter({!separators.contains($0)})
    trimmed = trimmed.lowercased()
    return trimmed
}

if filterString(inputString: myString).elementsEqual(filterString(inputString: rightString)) {
    print("Strings equal")
} else {
    let difference = zip(filterString(inputString: myString), filterString(inputString: rightString)).filter({$0 != $1})
    print(difference)
}



