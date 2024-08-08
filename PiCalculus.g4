grammar PiCalculus;
prog:   (parallel_process NEWLINE)* ;

parallel_process: process 
                | process '|' parallel_process
                ;

process: action
       | prefix_process
       | '(' process ')'
       | NULL_PROCESS
       ;

prefix_process: action '.' process ;

action: send_action
      | receive_action
      | print_action
      ;

send_action: '¯' identifier '(' identifier ')' ;
receive_action: identifier '(' identifier ')' ;
print_action: 'print' '(' STRING ')' ;

identifier: ID ;

NULL_PROCESS: '0';

STRING: '"' [a-zA-Z0-9_ ]* '"'
      | '\'' [a-zA-Z0-9_ ]* '\''
      ;
ID: [a-zA-Z]+ ;
NEWLINE : [\r\n]+ ;
INT     : [0-9]+ ;
