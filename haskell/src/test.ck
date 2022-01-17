enum MyKind = A | B | C ;

attack s = s + 1 ;
attack_2 x = attack . 2*x ; 

main_2 = begin
  let temp = 4;
  let boot = MyKind::A;
end

main = attack_2 2;

1233333 123.33 123f 